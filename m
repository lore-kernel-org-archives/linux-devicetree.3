Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498460;
	b=vnuEuj1+eX+GfF9xKFkdk+i4k1rc7AKQO1SCPd2Xw7PeGm9XXUWxmtty4R9hr5Al0tSc
	 yQXPDs3gZqiH0AyEQX+C0urnWGarDUxWr3gjNUZXT2Dk4qvC9IhogU8R3YSzNNUmd/HFX
	 27k7G8yMh5aWqMZml5UxtRZ3uXumTmn2glvFmuE7QuzJ6U9777mSTOGb9ZxrGq4nV3KZE
	 VqcvtytJM/lLlnYyS+X1N/SPuc01Df6xm7EWlsbkVlBjImpgfI7FQj6ygqKkoNtYpFiq7
	 vkewdUPWP8Il03nF2XvHfrHFVvnlBFqudguJWT0OWi7+mdkK4xgXiXx7MwlE82xZJJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
	b=kvMASV7AUltI6tqXjixYMODq3TiHOpLxJtM9HReFUmWkH12GIDxJqjp9ou73ia1wFlhm
	 JRvvlPYNpDoXhF6DQ6i/vznYoLzUvNng/D/lz2n/20KK3XOXSxesnTN5S30eaX2LxxYoI
	 HGnjk/pZ53yprCovP/SRs2ZrZIAgR+jFbZtezr4zhc4OL/zBY5DpESoVrHpo6eKu4bP3d
	 6yw7bFXVRlXMMRQD4iypxVFRsfz4rx+9zshr1UKYYXNIUhrpmnDVP+MBgLCeqiHgDmKOp
	 jXEr5vHYq6XUuumyzeqaCWZ7YPzjgB7gBQMTjC5L3Xy6elqpZHrm4lT+LP6lDl49kfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGu6Bczz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9wdRHBH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCA7606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCA7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGu6Bczz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9wdRHBH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxF6U1292825
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C0eviU1uGxv+q5EB5b5AtlE4
	8Vr0zFo3hsfKbgALgk0=; b=iGu6BczzOTY2xNJPwZigSiZSGn3BCjxbfsdu92lP
	cMWbENJvRcgCDg/prItIPIg7euHBJEHMSEwBGtYrbYhiqSyBwKIRykc6KRE9P4Bf
	DThSBNvuuKg0shyJATKxrPA8PzpExo1vdCIy1cmvA211b2DKgy8GUkTYbRohKW/N
	22/5oNC/sf+TG2bJFpiOKiqKTLMPs0zzadF/R1SlRPlmAleFSgG+UsN4yNK5NRWY
	JpfkHYPcNMOmKM5Bnx7hJdtSVcqINYSugjJZHXQPuFX+gloYSCK2inRR/EBO96xr
	gHaQB4vEKuKBib2zfz+D6HEH3xxb8o66nLKlw6e2NaXXrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:14:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so680055085a.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498459; x=1793103259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
        b=A9wdRHBH/QD9rHrl3SuikD47q5dN9D4chCAF6YAnCriPeuyyQKUbxqjwDhrg/TengU
         Ae0Jgiw4XeGmItFrjEiS+aVStpyNp++q/zt+KsURtKmK0HhWy0M6dNsdG/pKEvyOoExy
         +2pZkdsh1tjj6+rSMZTl0R+MxSc4kFQkKIRFW+TCBeekvwaRD0EBo0pHSGmmQR2VpHYD
         W4Vr4PyJtUlbJcSNi4s6gMqJErGjOUlEnLRkegmEK8q5B/A5dChp/UgqF+DJRtQS6qeq
         oefFPlMc0Uw52CvPqz9qXJZKRQv7BNi68eIPSezS4doeDZMN9uHx7SudgxV9jtnx634r
         fjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498459; x=1793103259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
        b=a+hNqbkeEWpC5MOuXQZK1BBDHPnJ2fZ41rh4AMtGiKk2STGFK4tFBL/mtr6U+Vgmp9
         3wtUeYVVqC6kgjwWsg6rYmL8DeUKPbJ6Q243y75lXavxQwHKa17CSZYCrB3qv4MCPWmg
         FSlohRwUr86sGFOEokK9OWL5lvCz3ugyme5++5ii33Zz1Zz5OG94NEv8BEHgUgj/iV8H
         rDFWscJTWyj+olYFYJyRF2ylgKia1q77nrB6TtMaVdxF/n+m7tmShKhNkRKZivSUkenW
         J3k9wNuD30fH5DcV62OZl4+LVcDE9OfleILEYJzYGtFKJ4PR2By5ZxyCkk5sraaYjEbQ
         e0Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxlzajp23BUE+Q1+nMlgMUBXLckVfza1MAN/4l1ZiPTIu6laPtGvXgcACbgsf9GNGtLu8ZiV0k0lOOb@vger.kernel.org
X-Gm-Message-State: AFq9FYKkCGUpIdQNOZXbLGcDACz/toKadSovI3KP3vg1Mvm9H/t2lahO
	OR0nQiiZUP5vX6sdXjxE8lplVkrCBtX44wO2rYnK0k2tEGLtxlb9Nds93yZrYYvDRu8/aJwROI4
	DyYXafcXy3zJxt8StvcQQ/vEqQX9Cc6ZCsn47KMAG/Xa5mcyz/IjNvyexof+cvF/8
X-Gm-Gg: AYBFou2bP8A9MIn/1P8SMXBg1THyZDe96U697npTNPHAwAJV1zV9jScWDKXqrpHY2C9
	2WJ1qjCWoN7LhJ5jKZZKJZXgxa7J7Hstv8Fn5eVaDcHeBr5xGEvblMHB5ur73K/xDvfliVY6R+9
	GoYVo1qIgpjNoO7I/P4Y+bmghyiNliVQSPEeC05729TT7gAmP1KfWSUo05ZlebLrgy8bnaBBt3A
	vNOqu8zk/rjtDKWGxHdnE5zOyW2B0g/kAjzRwHtqaCHIZ2piNVgIMl9wE/VEdbwBLIpbC1YDiFp
	G8muWcxducvPsLUmMEsHJqyhlCMw014/qxs0B2TzT+wIu6lEZUzJZ8sC62ohwjb2tO8xLF7LGl6
	3Oo23lPxOvzWPL6WI
X-Received: by 2002:a05:620a:2782:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93f29d1ed76mr1701108085a.53.1792498458608;
        Tue, 20 Oct 2026 05:14:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2782:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93f29d1ed76mr1701101985a.53.1792498457878;
        Tue, 20 Oct 2026 05:14:17 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1e0632fcsm5034185f8f.0.2026.10.20.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:14:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:14:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi
 as a placeholder
Message-ID: <k24rvwpj6lrapnph223rsff6ju2rchsmksegdbm6exofjs3ngd@6um3rrqod2le>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: Vf3WKQnGNIU4e9_9KLglJGxFrxLJ-V9Z
X-Proofpoint-ORIG-GUID: Vf3WKQnGNIU4e9_9KLglJGxFrxLJ-V9Z
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75b1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uVEy52KOV2DfC4Ai_b8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX9x3orwWQ9eZr
 ApZfe0+JXh9zDucoHDM7gbW94AFz6geqk7X8WbUkYN8jg5K/VOEgoOIc6R12ro7kKaQ6QNZDfl6
 vQZAhg5gYz79n0kvjN9bAZu2VsQl/Au5xuvstgm0H+dzssfwbI9ixt4KHbWAugnWu5APwVDWkGX
 +1lzEWr+gSF9fdTrb0/ARX/u/x5xNxhjfxC4tqCRzFfA9Bji7nA/tXpKWiwvzZPcaepqu5+PRmb
 p7X0OZmbb7aIxtyQKVFGx4GK+g49cP1ZMX1ge57wQcbrmgLuVMxmvfiTmERyuWTpb9EBJgvDjyp
 zeFHIfSRxnc7oTUHNoVzqYFmnZe8oAnCt7OTOljdmVvxqRW2pYbjweNazOAxSWKXGSIQWK+SvlM
 Rk9dsgVH+W9Im22lw/6G9z/ikzVJ5W+A5Xl+zcL6jK3Zuh3nTxOPRnZ4x7nevwjthPgLky1caM4
 fYuuSBMVbOGwFYcZDLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX0yfa7EjuV9xu
 nkVq2PbkIeWwCVNEyw+Kvr1j1ADTOw9RyfgSWIR2SLvjb1THFQRX6r4kWwTu07LdXei1UtbZxqA
 pZosf1XcLUQAkiGcCc5eSgW4f10XXXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 26-10-15 10:37:05, Shawn Guo wrote:
> Lemans is a Qualcomm SoC family that includes not only the Embedded
> variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
> also the GearVM variant (SA8255P) where resources are managed by a VM
> as SCMI server. The current lemans.dtsi covers the former variant only.
> Introduce lemans-embedded.dtsi as a placeholder for now, while later
> changes will move Embedded variant settings in there and introduce
> GearVM variant support.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
