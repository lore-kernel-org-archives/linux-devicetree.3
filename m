Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0072E43E071
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830825; cv=none; b=MiAchndAXXaQDKvy8XYWhA5gXLGJe61DIE/tECuMx8+u/RKAklCj7j7XXIC+R+EBIyI4ueQB7n2miLEc16a5G3mKve3mmodiIVDj/P9TZTu3P2zvJVX0yLzyNSVWva9vb+hHM5+tIWx/XriJc7y3mo3jMQaHpsjHl2vNAIjHJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830825; c=relaxed/simple;
	bh=OAKm82vaMaMeu3/aB1+1/H8WkwsDwUkXROpGLq6zs3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8S6Q3DhjQxy8VEWJXODEuW+d2QJjj5WIyYrmFJ4o+wyLb7UzhcUlowfl5QC6QrBVuvbe9vTClqOxEqIq63UojUGaEaeU5fmDdVKsVqXUwC8O3Tdtaz7Sym8Jf9DGw63SPCrQR8W5/Dv9Y2tW9rqHyxJqvSgSzr2xyFChrTsSv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6AN7QCd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKbZl1dN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6AN7QCd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKbZl1dN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9I1kN3978105
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/9K2OuhX2ub4vyYxG2pgMBrg
	twR0S0sr9MtCBKOh4LM=; b=N6AN7QCdHiz/dxrxUu8KV0VPvKaBZGoMzd7KWkJA
	9IA1Op630EJcxvWJOplFwHSnEOpNpI6Zzu4yjsZyBSohtxFgqsQsRJMwKWDOU9wS
	SGuhHlIcET/0i1pAGFy+jwo+Kxmnh938WUIPefBZwjOz9q5AYiv+/TPim6YoyZ0r
	ed6+xI+Mdw0ubvYQT5CKXEsCtPgas1slo7+rPLETuBTusXc59YubHL9qBly6gakD
	hlF9SIjiT8jOsGb+mgg/nG+xFaAY+FPjY1MpPvVrH02HUVn373Xm+L2jIAHFdK6b
	NUT1g9wJ5GwYl1pw4oYkqMc2T6vXqwWoQhy/Dj5Wg5OQWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egkj3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:40:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d8cdso267704485a.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830821; x=1788435621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9K2OuhX2ub4vyYxG2pgMBrgtwR0S0sr9MtCBKOh4LM=;
        b=OKbZl1dNgZFQPqPdYukyOu9l/kJOv+f1N7bXbSKJbJrud7X7nxWSooT5HUCPiafGsW
         13A/T4seoUdgOVZXXwxF85WdCR8Jv9GfQAvFUfqojPCpppr91S0LD6C858etq7mwnS3K
         Fqa/1ZEFhZ+uvJ1GN7+tNvswCZnzO5ZTLhVxTFC9lt4GAG710IdpTC9hpqusFUzhEtHP
         5EKgm+IgtgqnrviOziebSwIud4uYWHPxnxAHXvwHw8swW3I69yJnHw4CEas0B1YT+GjR
         quevBwJdRhKwjvma6W5HNuuJvgYyRCImQCZOMJSMKhMmqAvvb9MZhnLuFF03n8/PLt+q
         s4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830821; x=1788435621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9K2OuhX2ub4vyYxG2pgMBrgtwR0S0sr9MtCBKOh4LM=;
        b=XiCeejZF6OrzHA4uhUFaSVmuL/zvUHlTvjUIxPQlgLUTY0DS4lrm+jN/4bY0gjvBgH
         oh00NTRcLnNr4SVNV9Hh7Zk9rz2pLEQBfvBHcKvjYbNO86bcY82I5/5rIU4k21LwkuTM
         3Ca5FMN3zk3F3SFYRMyphDnwYG0Vkn+hV5IAaI3FrvOiD77/dCm30aiB5Jc96qzojtEd
         ZdWlRVMwEFmZZChuK6r43L5sD90kvgsRRnbBrBKN0GPyHlqkC6XlDKcwt6VqQ2v1HQvO
         Hbds3aSDLHQZm1UoDtxtgpTE/zHeQQbDx1T64JNWQSM47Q86j2NEQgF5PQ92Lbb74G0r
         uXRw==
X-Forwarded-Encrypted: i=1; AHgh+RqGK0hpwZubgt5O+rZvNAPLpD5vSPZcVKs7UENaOF6ZBR9h1bKmxlkUaPBq8kT6eIIf75d9YLs7wDgt@vger.kernel.org
X-Gm-Message-State: AFuF++kBuJvqHveV9lQcqiP/TujNMvgRZxhKYZUozF3mpa/K93aURTu0
	l+w6QIYapGzD7bupIEFqq9RYfZPDZAkF3wQ4E4lZIsH0qVhPgF+OVdYOyT/kY1Xtin0I8M9NmXr
	8pjmzUQUN2tW7PQrLQdd46BLQFyl/TL4lwnen4JFdmqqLZs/FyL0IGc5uOhWPII0OZEZXFXE+
X-Gm-Gg: AR+sD12aUWgO4c2IFZlSGn0lZfY7kqb4fdi7m6mqdHS3y1UVxAbm7jtsgrf9kWp5nK4
	TJtsFmwM82JRJ65vRv/vUzJu5AZ0cGfbAhQjVT2UA9jgxlJAGO26y4QPBxt3LWHCMX9nD5AHecj
	ENE1hu/+BsZQ+8SwsD8q/tjNPomelfv1BIOpJ8XCYcho+lo+Ev0OFzicic4LR0uxft3NCTtWpdE
	YNsYMMnpW5xpyt+33vdn8L34SpXlMTr1XbX96n/8SqjSkzW6aI++ztu/nDTnQbpAoqfmeDrtFSl
	wQOo120lwvsqAuLMop0GyZEz9xzmhCzdoJK+9BEgpQ8iuRmX5JCSzs1e/JRPZ5ZjoSTAiNtr+A5
	eNhPi96NIA8Wq
X-Received: by 2002:a05:622a:844a:20b0:52d:f484:eefe with SMTP id d75a77b69052e-52f9f9ce476mr55498271cf.35.1787830821116;
        Thu, 27 Aug 2026 04:40:21 -0700 (PDT)
X-Received: by 2002:a05:622a:844a:20b0:52d:f484:eefe with SMTP id d75a77b69052e-52f9f9ce476mr55497921cf.35.1787830820613;
        Thu, 27 Aug 2026 04:40:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm57928725e9.11.2026.08.27.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:40:19 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:40:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on
 external DPs
Message-ID: <kz3r6x77eo7547qwjcboajzhqdc45qo4p5ko5kntwrerwke4wz@bwcedtixhzbm>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
X-Proofpoint-GUID: b84OAc_i39wvTaIRiGLgHxm1tOm2YtjI
X-Proofpoint-ORIG-GUID: b84OAc_i39wvTaIRiGLgHxm1tOm2YtjI
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a902225 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Uer6SED5Sbd5OPh8DIMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX+V0azRAGh2KR
 JWVJg52wIxKpA+BdApB4d6x/KSH9z65Bx5EWk5sW3gaexPqd+dy1mChydSsnPimr+IVPwcfSiM5
 z7sQRmXvAh/cfgxnCXe4a0KgbIucelg8XMZrzX5vvzwPOBsKX2ustHRnY3MSTk92KcqfH6sKfNe
 D6VlLkyDqKcNF078mI7gzvpxPRHyCpjWV4j+oBLG/r4pNdBE3eFBrcZzl56qVTEof4794YMHhOu
 HSJxxo7is6cMjQlRTqn71N8haVcCeF6LlVaUv9TxNNC4Z2+N1g0Mq45Z4EGxX0RDz3HqXskpoLk
 GJxlQrjugnRqoX2/5GBOjiTojU2FL/3o7JXeiK8fmXk29vXdPklBAlUoRNoVgW8PQzUShduOb4c
 2vEkj1l+WHSz5VdrPw9AGpatShbq4x8uCIw/WRwAbUwGDBCzq3R9t0+y8GF6ZhQVkHTpwRMGKKu
 DPuQuBVe2f67tdB4VOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX6zZxT7dn6tVI
 hLzVb/3R/HvgXqmLQQiVN8ZvkFtoYwb9koAhocFXIB6OxsfYJ1lWJUqPEELTfSnTAwnfYZisoL7
 WGjnpKjIos+yXBSf/3C7UvBHL4ng+R4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270096

On 26-08-27 09:52:48, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> When no link frequencies are set, the msm/dp driver defaults to HBR2.
> Explicitly list the supported rates including HBR3 (8.1 Gbps) on both
> USB-C DisplayPort endpoints so high-resolution docks and monitors can
> train above 5.4 Gbps.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
