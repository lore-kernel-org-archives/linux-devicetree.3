Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43456339380
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718095; cv=none; b=SR3fU2067vjKFA23gGN3TAAjbbI0WjV4eMF78nYVzwJffTpqEw4UHqpMtVqoFXYVApBxzH+DC2Lhgwefc8P7OwOPgWTLP0KhLdeSwKdgMX9l2fv4ezRoneseNp+HXovYnsFNvW7lgXlubg7QFgOjmjYCw0hzq3cDxiARkMrITdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718095; c=relaxed/simple;
	bh=KpZlFaZSk0bCJRalJv51qXv1VtxIQcD/5P2xCfUWLRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2yaAjyPj/NnJGurZ4zSowfjgHBTxYk+dHBuiAjs9XeXUYRBIanQbleMBlMcJdshlrhdtmRG1U2m5OH9E4/NlQoochOCrUzo6+fHwxUjcWia815+qywab2ducDLWUqjv/umkiIL9F43BGseUS25iW4Ik/iPwxN1nXiAZ0+g70AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsnV+k8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNZBM0yO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SsnV+k8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNZBM0yO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xaY8269708
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rXLZi6cloqI+1fOQHbQqyqZq
	/RoASS4IPrXeaW4QNGo=; b=SsnV+k8YcgluqABmaJGyh3UaI8G2ouicsGvCSWU8
	LMAoJm7F3Fidqp+1OsFex5pmxCchG+Vy5StekxzJQimO9VaiNonXZ9I552MDhkvr
	iZNAGPoyfmTMlAH8k18o//gFvUv2+qSkH+cDTnzVVnEU2Fkh/NgHAubrgNKPrIJt
	ycoZClYc73Z6ohHbfipZM4Bn3rPlApvWhSOk0t29b4qwwL2uikGzQN4hGQMomOTY
	9Fonuba6cjlRZQmdhlfZ1U/jI/dWnhv0tcuPd67hlQkCipa28IyhntUKQyICAXVk
	OTF3Tfdye/jACQDnZYgGoC+fwPvsNO/7zBCVkQWg1GxF7g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6abmxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:01:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d2f02d2fso9341634137.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718092; x=1785322892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXLZi6cloqI+1fOQHbQqyqZq/RoASS4IPrXeaW4QNGo=;
        b=fNZBM0yOWXYJQEa+NQxsijgC4g2QDjIsamWENVnaeRwE5qTV4poSAobIHKtjZndt5M
         6hPAvdhA5VeK0RkJnfvRdISzv21RcyAcqAR09Cyrsb89ovCdDHCwrf+0HjoShhYCHNQw
         unhKx3rU39bLfHBJUYCAAuOMlQHgQ8mAVWv8NuqtGoLH2LhFe08xfN9WxSVdCPljKjG7
         kLKzxWaMkD9mvFj7HVbWO2hi28FkNzaCtNmkaFCZEbU2JHw3E0PqLmt2jpbun+Q+LqWv
         uSaQu+7fGTDCDew8/jtkqyeLNiv+PvR7IS7M+uTygv39HBMzKNIpx+RH7VmynbIkdfbJ
         RTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718092; x=1785322892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXLZi6cloqI+1fOQHbQqyqZq/RoASS4IPrXeaW4QNGo=;
        b=V9ls3JmCAmwPNBu3Uo9vxv7cZ9RuLUAfZGgQLUyfwdov6g5J9tNcBXVpQFzFeqTu9Y
         vkrPogaJIphYeeRTLuWW3B7X52GxtkkTIBqper9IhzL/xTDAkjffqWruoUwj8sIhESDc
         n/CKZVScyhZkyGyCRN8vFdHml11R1XBkx0wBJ7ikbyVKBJLvMfyq23jorbzVhvhzTkKf
         ByVW1LTQoW4QkueSJjtmzut01ADrjhJqM3jxhQaerLQ8RlHDx6X3qWXnf9ZiqkEs5RBf
         /rsGWa5AZFw0Q/6Oxwj9sRMv3WOemnMIvZsLhBxqxEf/mBj4QnmydrB+eh4G+2HgMjMD
         fEYA==
X-Forwarded-Encrypted: i=1; AHgh+RpgNQCWWu959EttWYvqW/nlEt9NXq/esxDAp6v8k4lK0vrXkOWeOoGqZlp/dgrlvpEiql3nRGONtm42@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdRqW0KeAYwb82g27vMuAK2K4FRiUVeWIwvcGMNSg3frFp9P/
	3CqDbaPzwCeLBo03oraSb6YNBFq2svAYWBW0z8PijWPMs41XEGJ/FGiFfaIWqG3Few8j4N8ccS3
	Jlb1LKottxi8bgf/ftM8rOARHg9sTsjPaq4OLVJdwBav69jgMoAVHtUYnWgEmKFe2oV3dWRdA
X-Gm-Gg: AR+sD11UBsUhpAOA2b9C2ZnWmxpsk7ztk9EYjMKiXoQwLV5RN1Brp9+VMDgwlJED5u/
	JvPJYq9+96iLppYE0O5asbtrOEkw7K6pqI8pxZp0dKBLbg0U7MFCj00xw0JK9v2G3XZigZ21h3A
	u0ktooa+JKL+du0OVDm9eBEVfboj425485FlLYtQJjlWB0q+7qU6DjsYJ6dRXBkIILUK74j97Lc
	cTfwZFoBjtVRFTrFudiu1Zn4rV690fF8XmmdUAJgDwt2zQPQjPO4QVwNfyTv8S1Hcf2xrc9FHlD
	NzHoYfzkORVzbWGj0gUpCAYbrTtLfK+/P2w71p9doU1iDn/iTCD1GurQF3ZcJOuFOPSkcjl9spN
	3Ob7wEz/TlqxUin4=
X-Received: by 2002:a05:6102:512a:b0:738:c9e1:c58 with SMTP id ada2fe7eead31-74753762e27mr8794617137.28.1784718091075;
        Wed, 22 Jul 2026 04:01:31 -0700 (PDT)
X-Received: by 2002:a05:6102:512a:b0:738:c9e1:c58 with SMTP id ada2fe7eead31-74753762e27mr8794586137.28.1784718090382;
        Wed, 22 Jul 2026 04:01:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm5072613f8f.35.2026.07.22.04.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:01:29 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:01:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Message-ID: <gyjvnu2mljqdvwn55z42tjrvtmz2nrqrsxi6rclsk2ubnehnw7@wwm257efnqyg>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
 <33arw44e5cnz3ui54f442rkgu4smczb4fwuyiouxo4lvne3v7e@t2tl3fsq3cxf>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33arw44e5cnz3ui54f442rkgu4smczb4fwuyiouxo4lvne3v7e@t2tl3fsq3cxf>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX9xcyXjexVQ+m
 6K6xILj7DujQKZVZO1+D/MBh3i1hSglRpLZQ1E1Zq95syCqAAw+nrdKp381yvlIvdZ9ySdKpqWJ
 D0/iXxBgb7m1FnN2ehxQoPH2W4YF6vwXlkw3tXtDZtHYXxtIhKbl/IRao4DlFsPFq1KoSqwsdoP
 iWInVKjpqKlDYi4mmYUPejX/FchsL16d96j6Sw+w8d4LDewjgdyWdpxsUyv8M2vyFffeqUx6Wjw
 QjQG180Mc0OFseSfQwjquuFvFNywk2omYlPfBZmdYOzq2mtO1UyFcxLb1cSCRG8wQhT7/JM9MBg
 qT9dVjUfS4slb2MJcDexF7G/sOcOq2JFBZ8PURWO3xkRz6gPX+5isJF3Fz5G+09p+La5cIJx+Ub
 CUvwnMt871f31TtG6OXAdVPZUVF7wlP9mZxR3oFX94AZxiATuiMkN2Ov9tooQTACUtlzlAIgoAa
 OUOkpNKiqYjE9mfzG5g==
X-Proofpoint-GUID: KT_hWf9VFrZ3pAY1v6gMktXqb1QnTMi4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX90bGO3HaC3Ps
 +bL9UFyhbJ1Ky+2N8a2Qii4OAy2+y9KLCicw6baBCu0gLQYHKgZ+MiMZrlb3Gp2VZYd18PzTH07
 LcEz8t9KY0E0jI6EL7neKen8vVx6lDs=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a60a30d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DMW6ywgVKRl1gz1Y878A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: KT_hWf9VFrZ3pAY1v6gMktXqb1QnTMi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106

On 26-07-22 01:30:27, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 11:25:48AM +0300, Abel Vesa wrote:
> > Describe the CDSP remoteproc along with the related SMP2P.
> 
> Why is there no glink-edge / FastRPC? They might be not yet supported,
> but please mention it in the commit message. GLINK should probably work.

I'll include the glink-edge in this patch.

The FastPRC was sent separately, later, because it wasn't tested in time
to be sent together. Mentioned here:
https://lore.kernel.org/all/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com/

I don't think commit message should talk about future work though.
