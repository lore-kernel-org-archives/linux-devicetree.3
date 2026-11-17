Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905459;
	b=Ys+t+CH7RyVTTi9huUjK5LP+hbhbR04CJQUCHMbYr6LjyEYstzZFcH5vqHsuPKB05mDJ
	 SfnU0udmfaEJvtT9Ln7xw7J190omUV6YiuXOEdzQlNjQeTPO4DG5i7OHgadzhUyxwVICA
	 55JhtUrrbpzoPfnv/fNXovzW2VVZALh5dkXs0N7lU94PnlEicGLhugoj/RAPkPbHEWYKW
	 Il3NQh78pe/h0KIvSXqnQnzLyRcRnoi7r4/6RkXOZP+NVW/QfFmTQ0jrHTUTbnn73zAp0
	 xsEFnwb19dWr3r3huj4BsMSbS+iG63Ralbh93ef/IDWyuxzVR6nV36Zwx3YCvKINzug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
	b=jsuBzaA/H8blLeDiqSFUVFf76j/lbUeIFKpbE9mXDil0oFaS1gZXdh+cvazX4PZ6mSZT
	 2PSwUFoRfVwD5ZNGS4N2fZfuLzi+Zp9ttPyVKJwctYXISfqndY+RUs5I+SSLTZNqKHLDq
	 RaCzWdqiffI7nKR5TmqNe19wglxHT3oMZkKtcQMQtjSyoOZJ2jrHrgOh2Zbn/0fJEGQu1
	 dRluH1Wew5XmOXPUESmPrUcRu5c3MDSQ17SenGmEHjzX20a47yZQ3sVqMfBozkRJSCJiX
	 WierLEgEP1mm9T2J3ZlshUn+LBsCXOPe141eUQDKbB/TgWswdSxZpapmtbWmlrS7bKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uAdmTR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTH3momC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD2606A886
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CD2606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uAdmTR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTH3momC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH654xD3595427
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hL9hddK73asRbtuhj4FvdSTn
	jK2vhO5tYp9ta4TqGcs=; b=Y5uAdmTRGT9dDM6+TuMXcj7ZLw9COd1hOeWbckR5
	a76AhGt05RVd1yIXSQMQgsOERTJyoZG4dZ137OjDLu4vmmZXhrj0CMRGinKscKJW
	wKAiOO2SQlGT8A2XANaYC+5BPs407fcF1Rd4ety0ZQ35lO83a+GVBUm6N9FPEZLU
	RP60LdxnVyX6paDQ4y2UgymidEmn0NLF83IDmXp29vmpZrfbIeqtrh5OtS/QruDb
	3bL638w0DVQriT55EMhQGZqD9i/f/RsFwnk13jndByb94c6vTEmo/M/vJKavoCg5
	N4RUp6hSLi3/J2CnNEqfEx4urPv2vi6wFKacwjMOhAshhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8t5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:50:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso669696585a.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905456; x=1795510256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
        b=GTH3momCXUyWekCtB4u2TZa5r9f2B1jFJfRXdCRrxFxkysHzR8ctI/0AI/jCxSBJDZ
         rEFLu8kPNEoRQLe33earEM5QL28eNpbhJ+rtCYOiwpPhWWi2F6BpsnCtLWS0STVqA2yL
         oQPqVwaP1vM3fHi2nq7NnK66W9XHS7yvJDtj10bK0v3tovWg6uLq3QuUP+Tqj0ky4PG0
         tkRSBfvNg1O+qwAvS0Zfli1YPiC7sRQTmeJ25/LdmNCvdRSnhjEXI0b7JrPWP9pghEGn
         FZGjuQrxTGU5Esbg35ql/PF1WQg6z4/o/5DSDBfjhmDcOETA2hUebB4TkCBvJA3dY1sj
         Semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905456; x=1795510256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
        b=0PvF/HDFpu7OwfR1Rp5pBgkVswJI4q/KoFwq7xeiXyc0pWs2G/9sKRugoeRaCN2VCS
         c8LW8RDogJkpwcn7bjn4oZFs2J+JFkd5K4Avi8u7h4oTjK55KWFEnj6UE8U80bhdoGQ1
         fkv5jfdu4az/qdYfwRTbT2B/g9OwgY4Gputi7JB7IYWQ6puWDF6Veb+MdzoeuATwiKsa
         VF5cDZxN4hXOqW+OeFZ0kceD2I3LzH/pCFfI+DQ9gOGmkZ/e9pEMaWjtr5R/oYsGRxZV
         5XYkVz2jT7EZ1NDtpNdeAEBaWF8dpQFP+QQMEq6VOlgpCvlk+BREpMWLQcCAR5XKB0A2
         BhOw==
X-Forwarded-Encrypted: i=1; AL+hErHxZoq8ENt/S081E2bbIcOXDZJMqouC0+nsEdKlmSRYpCDtl5x4xl7wiVqiBxflyzUpGHqnlWu4h7eJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/sk7343eWDorgQUfz4rphdFNOydm3GsPLNg3zWfuNvhExBYluU
	knyJjL4OqGYYR3si7IkUVyhdt5MIYjnaVgNbhTKNy+O6WVhvJFhfaHUW9IUSwcocNRR1tfDjGRF
	RVf9n0DRYVn3iV+IPmFzbhEB2AEgaTdM56j3Bu6rCTkecVQtV5ctnnjIW7l60046m
X-Gm-Gg: AYBFou1vBK2sNM89ZJ2fcc55iTARku23nyTbUjROfofgyzPl4NNfBr7P1RHKhxSyJc8
	PRKPIv6PRPFFOsUW0eb1Kd4M0iGiUXF3gQJMGZcjeGyTmnaeOHBSLcA+7zV4+qu8rcUKSJDELKu
	nB8Mw43j0LwaaQXGcfpfXcGI3FFL1q/2AYSWL6aQWgG8rHQlXP1oyH/qDSo3h+UcYL33qFhjAzH
	G2/Wau6gFMehqVuKHSUoRzKgdURH8KQ2Q7w6nsmYm1u2dTEn0G+AHODRvzfFa7Tr9u+8ioMhHfD
	70XoDAd98/WOmVaYdebL9jrUb3Asot4PbJrVI/E+yWuUrL+HQpRHU5Qua5OvRC6Bq1udRv6rXaR
	O531N0M7HwcIZKpCuj6uIHrqah/lGyfth07D7rUnd8HzvZ4zuPYE+LVMRvp3/hQKt
X-Received: by 2002:a05:620a:4155:b0:947:7691:731c with SMTP id af79cd13be357-9494bccb8d1mr2102672685a.65.1794905456399;
        Tue, 17 Nov 2026 00:50:56 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:947:7691:731c with SMTP id af79cd13be357-9494bccb8d1mr2102670485a.65.1794905455810;
        Tue, 17 Nov 2026 00:50:55 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566a8a16sm170923935e9.0.2026.11.17.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:50:55 -0800 (PST)
Date: Tue, 17 Nov 2026 10:50:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] soc: qcom: socinfo: Add SoC ID for IQ10800MD
Message-ID: <3cij553mn4idl6g5spnmerulglcgsc5s5nrdbg6zrcrntj27qt@mhrfwetsxxhx>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
 <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DMhWqehNgDLhci7nZBKj1qSDv2KENchM
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc1571 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hvuvgssclkmJWzRjKEYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DMhWqehNgDLhci7nZBKj1qSDv2KENchM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX3C1WncwVCQhq
 /U4hEs3iLztUelkoq+h9Qtqzm45j0qxtDdii+SXl9yMf8Lxed2Jzm/r6TYC+GORvo0aQxN2pcEG
 Jm08yV0vjDUOCUdD6M/By36y6bIWVGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX2q8yGL2YFGfM
 OETItonT9SmLiz/MheGrvj0bF6ZLH0pOIVf2kyUwyySGAlqBpxhkqK6vt5MhtB7QYYUvH/Lvvky
 CfJs6WqCmix1xOpm6x4II9S2zga9ln+6tLMt9ESjZWE/rBBwIvmAmq3VSs++eMjfsG8/hccJJOc
 BAPXkoCeCQ8sWKg0U9ZKOqz2H4pjVCwE3vneNJmbfYMQwm2jWYabvJvNP24+UjX8gRES559nn8M
 nqi1yRIwG7phXRAs+pTINSGeP0Gx3pTYardZK/FkjuSv5GkME/MRPe6q+3leRAotju6cdSwNkUM
 0GX4LTSHJLOHHXDx/O7nSMMf7woANbHI3LrcbAsny61xs1mLjeovQDFaRR+9vaY6CiVw9lBO4On
 FUSHu+s0Zga5iXHgC0ie96qlVZ2WiXo9Id/1IxQIpKwDFZ90atR+AvBqvTPy4vDUqHFOkPAZ8vj
 tq1TFcD6uY4JxeEzhXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170035

On 26-11-14 21:33:04, Shawn Guo wrote:
> Add SoC ID for Qualcomm IQ10800MD, the robotics SKU of the Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
