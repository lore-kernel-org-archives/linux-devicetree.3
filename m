Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411626;
	b=qcSMxS6fh0pn9s7XlNnWVJ0VOKB86CiUhzQweTRLnojnsdTOc4cok3TrBxHCtkPLh597
	 LdDALzKMSviiDC6zWn9BmbmVK8t8JAesr3KrvmgoTkYDkuQT30ZCxIO/B6pwRoeqeh5AR
	 IGO1SlFiKc4DgIPCDPiwxfVibVMtzXSCIIyOnZjX5rKrO1RXRcnwPYpaa2l0tju4tukn7
	 w7M9rFhUpDu/noDbO9OVZj1tT2l9F8YxHljH8+AhowTHLUXZr/IJKG85QOvkJ/GWai09/
	 Iwek2GuKBOcDWO3JY/6A8PTguV0QU1mo+Q4cj2VVuC00OT19r1TJjIYXQcVw9Tlescw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
	b=ye5f0nc43qqnN5V++b8qhMBhqstljSylDHLZJ0NSLIXDK94eqYgfGT3WjA5VvH6Voqi2
	 JtuZ+R/jEh43Dptf8HZUU2Aw115BCummt7I3kCAr38iERwcSARI0yBmkFibDCu9G4kcEQ
	 68jHYLxJU3ha2lo/Bj/pmGNIQZMwQOiO4H5fp0A4/Yy+VXYmw3awiabDZr4Ewclxgf5oa
	 7jqBocJ54xalDwEKSLccq2+9JUJVenWRMhB1kHE27fEaf7keswBJH66H+AjXkrrLC6UOE
	 Y5lU7joI2HFr48QwM8W2dlY8UirJv3QkZDplOvSp64ayACD+CUcWc5qObl0suFYNFoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1wb0lQ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69860A261B
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E69860A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1wb0lQ6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04cQ1665568
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGCAfUgjVkl
	diKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=; b=cxaw0+0nJPb8xv1OcNihqrICR19
	cOUC/HQjzbHBOYXUQp8NZBtSs09TJ7g726jbczD421vHcwuFl5MM6BQca8bxpTX1
	RNz3JACOR/vBdO9XcTR2RSKWAuBMmHGWHFmi/zk1q44W6z/nWoTtIWdEoDFMFbKx
	yrr/e6iWlm+T5OZpstJVnmfbuF1cKujcnH8TVVXBG0OjfSNkP0/TXgmzmzLGmWuA
	G+0uoUWHYow3JIXCTJMMo8TYAO4Y5OxlDvJcfqPsaqpcxEZuFNd/UIgaUAT0L6+Z
	1dDfQKV9aEu+oVlGH4c83K1DkURBxKfBdXnnueftAyAKPuZPOzOjn9OdW8w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pt052-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2ca2a4489so760081137.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411624; x=1795016424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=B1wb0lQ6kbm0/VYXqYyiLYQAv/h22dVx0igTbOy4IRvr81dGXQbxdtE80QF/gyx/F3
         gmMycscsjQvIFn24LUHWLiTr/jDQTG4vbDFo4VOtWzu7YKIOpGXiNauPY5jMAgxrdMCQ
         fmB/II50yO8knq2OGENhgoYMOwUgy/Q5lykD6GgkwxSLzq5H3BuRCpOSpiEnbGasHddz
         YHYTJ7XxNNH7uKBVNT2NexW3rnHjgeRZtmfEtcCUm2Az1cVsTNZH06O87QkgpwiBAF6N
         uqIbLkbQqULZDqcUqU+4tHgzLcKfKdQLEJwHiCdwb8E5hYOP8UL/NKqn5cZD3bkQ4Nvj
         InOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411624; x=1795016424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=2qqjN4ceC6cf1jRyQlugZarTqK4zofdqePqpGzZ9MJ8kbaadusoLoO3sbGAGZxmiD9
         usUHcpLfLn1eAgJOz8YYiZMaiUUlBMPYKUjSyVlH6xe+fRRALhtzhQMUqyFZniMtDQ9+
         k+8LBtbtao7VshFWxapKX33K5GMejeY5DNuN56qnUOvPUE9bliRepQkeE+hjeRB+iQxW
         sk+i3JBCqZDbgZYrKvl3roH/VPMeuzOAnyG0GdDvaLopJIiKOzlp/SOT249Px51FQLnx
         1PO94rpUub7Q87Iqa464L1U49Vtdo7nwR0FpvYgfle61MNLpSGfrjGq8YwUIcBHnH7SO
         7C5w==
X-Forwarded-Encrypted: i=1; AL+hErGsfUKWPANI4Zt/hp5E7ukoNCQDeiEsxHOn6iYQwWeUzAyos1lo/o1JU7hNtMmABMKRlV9P0a3cKxD5@vger.kernel.org
X-Gm-Message-State: APuU4Z/J7oiwKJhPCyXhC6g+3VsM2IdoTXpU9qCFf+RJPoTAlzJL9sMX
	hg6N8ve9hjJemat5ef8I0vkS0fUDg5aS4Z8wioMVeSakkdmZbP2jc1nXZX6ae6MS8NTCFgbKSLl
	Xt2TmPW8RkouhmzFWvUSLyaekg79SdoYEItJoYyTzwfD21GPlg4WOw7utcOI6/d/q
X-Gm-Gg: AYBFou2bENV3IUzN0jexTVCg6TeUv/eup7dnknU+qvrtRCAxzuVj6QT0oOl5wW76t9T
	n4oZ5W9Tfe8Pv73QUNb3U+o4Sx91lBDGirk+TpWBCFgeEPsRQfEiqfCdgR7tCHsbHp0bUEn3kGC
	dDa6noM0Uki5F+oY9pdgfn7GdmJ4UMntz2Y+8Kj6aeQkZMuLvfQrJonlaUA7ePkSmV7LdCeRDBt
	KhZZYw3N4WwRtH1LcsXScLTC2VOwRClgJzNN3tK5Ag31XbR8ZWBYexJuczNgNc1++a1Eho++ycH
	yVgw1ptWrCYCuhH5ioYtN3J4UPNWA5sETjHZMKQOmmWG+VeXXnQeWc/F8aMvkKZtqYSiFXMyPWY
	QdD/Zg8FWFnU4oQ6/pfKqY/y+LM6BCyLcKb9ABt2Vdrk8mS534ffmUS5I5jDzRtS2AfCa2W4euw
	==
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923941137.4.1794411624566;
        Wed, 11 Nov 2026 07:40:24 -0800 (PST)
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923924137.4.1794411623943;
        Wed, 11 Nov 2026 07:40:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3528265e9.13.2026.11.11.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:22 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:21 +0200
Message-Id: <20261111154021.654708-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com> <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX5WveQVfKySB+
 JFTq4vpu1sdFc2Y+4VbW8id4dkcB1Oin8ufSIrYk/qEJM/4o35b0yl4rShq9VjHTOxg03BTrvZo
 4VJd7eoVqk+AbJ+X2YI0Ff8qu0hZ7e4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX0my7xPLnOhld
 8J9dNfjIko5qHVCFD4vuwBdp+581VZgR4fAly2v2ebkx0Zj7WovlE/55U0GrhAVlsH8IIRop5Nc
 zi0z0+52Dha9OMELpRVa+FZKyPy2DL/Hzy4p7afbbZtkbpnd3JHNC87djnsNszUuJd5J4cXCnkM
 tHY8oCiTosrYHum7QBHjyJU57uiHLvR/RM113N/KjrlfKUXKjzC3WK/AGcEozRjK2hNxPU10gkx
 3jTf6R1sSMImCenIpMVfJF6TdP2Rwx/UFVhOleWOKGDm7L5a9FRydx4Kx/iKeeW+dR1alFS9huq
 pcXtXk91zu7sKyxdqVIZ9/uGW93OjADCyOBKifj3nOa0qJk/4DBOEX7/6Pb2ntGBz7ieMvExXE4
 eR/mbakZ0PYLaUQ1husCZbOuG0ptmMl/UYqOgxlCQOAffp5jI+SBpSOUNgfgoO+DwRpB8egoRRe
 Z1s+ZRSU3kiv8nHRRPw==
X-Proofpoint-GUID: 8aM0p2v4d0DcN35dgC8Fv03jAFHZbJyW
X-Proofpoint-ORIG-GUID: 8aM0p2v4d0DcN35dgC8Fv03jAFHZbJyW
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af48c69 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=dxASnj8t3s5ti5x4tK4A:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:17:53PM +0200, Dmitry Baryshkov wrote:
> > +			status = "disabled";
>
> Same comment. Enable it by default.

Ok, the same as for SM8250.

> > +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +					<&rpmhpd SC7280_CX>;
> > +			power-domain-names = "titan_top", "cx";
>
> The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
> MX should be listed here (and used to cast required votes on the MX
> rail).

On SC7280 this is different from SM8250. The camcc node has no
power-domains property, and the sc7280-camcc binding does not allow
one. In camcc-sc7280.c, cam_cc_titan_top_gdsc has no parent. So
TITAN_TOP_GDSC is not a child of CX, and a vote on TITAN_TOP_GDSC does
not reach the CX rail.

I see two options:
1. Keep cx in the JPEG node.
2. Add CX as the power domain of camcc (binding and DT change), and
   then drop cx from the JPEG node.

Which one do you prefer?

About MX: Ok, I will add it.

--
Best regards,
Atanas
