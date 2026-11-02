Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633706;
	b=ypGhsj9haUfXe/H/sPTb5qVWQ9oG0nhKhlyg+54GVe15+Dqk2YThWP7PHopqBqcOsrRf
	 SJefpTHE4/Hq/wxOv08nFeq400bw9KZThK7y0jSXENC6/YihToeJaBKqqGH95iGKH6o2P
	 OwIJqzUfcXbP7gLkxDa5Gz7cpbFvl9OVBYd9IzlYZwfNoeK/gDQQUYcnD+noU61ypB0MT
	 cJng3cGHO1/34MrW8yi2VY26OWh7NEtTG8EH68lkK7//tt9+aJndk9dGs5ebeukJgcANe
	 WRM3K4EHe0hDbdWXyBcAlmmIoDuYTE5o370X1CEq9eRKVn/2mhY+ZtVe8LBCVuMzY4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
	b=Vs/Xz8MJUsskQJhjIpnVlpgjKlnkNYrm/jtI+Detz87snbfoCoHRZSe2tv+lY46OpbeZ
	 fPpfsp3hnQ9HI/17Mzegsr0oq6yZrqY99gX7XfyhczUVsdiyvmJnAMHHI93Gm4QvFV4jZ
	 9Ka8vdVBgE2fCYV5jQObMwzkRu+qNbh6bYJ5qPcU+RgAg14SBPR/SE4cdzaw5EzHhq0Tt
	 FDRINIQ/9ddZFEniLvp6SWat6cOi6HsRqWhymHDETs15YhyXmXCS/0XWu/GwPicivlld6
	 IU3NlRfkk/g56UCEiiqZgbnumUvf9rmpUs99/nwmFTNu+36rUrKFKUKm8sMyyE8lDyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhfS2aKU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPc8m0df;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847A60DDD6B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5847A60DDD6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhfS2aKU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPc8m0df
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpeXE4062859
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=; b=BhfS2aKUNTCYpxkM
	WpAQunypo0j5+wjNL8cPYdY5uAqXZZfplp5hB6TxUIiOLQ9kZr9j5kn2dYtcLC7p
	9xuJBDj0O2l9MDs3du4Csov7RnhqHKYx+X1QAsfV+larb/JnuOic5f4AxZa7/6U+
	N8m85wkxxraowHlth7+TcMViLV+JafJaGROOK8SB49cEipH3Z0qYSy/UOGGVjccz
	04iJqes5A9WTxTbrF25r3Pm+6QKFWuKE+hQfAjXk9OgNkmqqSrb61xVOz+a2I1mS
	jXeaUbS2TKE+YwI1cOnuf8M2r8PrOWY2QvmhC1rBuYMB+yfVYg3+I4I8HRGnbmvu
	9m8izw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmet189-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:35:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so351645685a.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633704; x=1794238504; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
        b=KPc8m0dfX44sEvMzIp/sS3gXXEOogujToeXs+PIfhiVFxdKSTX5irmyfGwVg7UW4Ce
         6FPMHcNinJK0513HIcmW8eRNP63+fOcmYnuM0gjdrFHKaKUOaM6C1nwLqiXE+A3KkO4v
         Xy2Nf2/lYaGmP3Pb7BrVOh+RGJ10IkaKNySjC5VoNhHzLmiCS+f6SIlU9lIdEBeMeS1V
         uSTaSpk8EpJzrLaadf9W+gAv2IdQqZGsRDmZZdCm30kg3vHg00fTJNb7UkVyII3eVx4l
         fIz1mLbaIfy5sPBTIbh4fwHN9jUuM/8NdDQh9dxbsOUZ+VaUi3sVYnlc4b8LmbI1gTRO
         fZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633704; x=1794238504;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
        b=FlOEaf1T3Cjvu1++A9XtjZyw6L1X74IVAK85A+VcaOd/2im3fbGFFMxTXltxDPQObW
         pskFDy8tu2P7UJd5WQM7826Hjsp5GMFhyNauTfHWWjgcFFVO7Ko8tglCvVlZ9pzsjrw5
         u6hSVvbVwtCXbLgqijE7dMTMAJkpKYJO2tn5sax4RoBGXBRnIr3pWQcWvmPVt1UirUPG
         NFMHN6dTIP7WxXsa6bf9NbQaqPO+tnLmc9+9Vy5wgd38UC7lisbaf2jOAqDPl+O3xLBF
         5fU5xSB27DdbjlcMtWBp+JrvKevtmoTZ/VMuc6HxW7yN7ByxF5O09GRqbff2nwdeByxr
         +Y1g==
X-Forwarded-Encrypted: i=1; AKwUvBz7eOGLc44v8hnTiewqJaF49dHYnOZubLKgP1kG1tEvn5pYeXQ01pJDTOlPkdbc7dl5TYu70csxdMtH@vger.kernel.org
X-Gm-Message-State: AFq9FYLqlqEZfSWuL5xDOFSzrEW0OMhELrWZTp0S349vkbcCL3F+lZsz
	CDjj4mJLgfwCPpLlBoPCdF4tIZsIlAY8GCbeTT6qP0BHcv7cW6kjB1fuQGS5KpgYL6JwyLzCKP0
	r8zaGuAclZrOtQGUnx71C0E+L3hSuZ0AAiK/2Gk8qZvGKI/IBAG5cD8Y6AhKdSnlw
X-Gm-Gg: AYBFou0sjJVZZl4eUO/AKj5mFo9+7jAo5jnRJ22n3EQIfKXKo8e0w0RfXJu10tfh1lI
	biZllPVj2QwSx3KaMksWuT7A8coGjWYVb4R/Pk9KdVq1+ZzUc0QvlnJvXpuo1Afsu8BTuoPtjRu
	/p91+SuXCRsCgjlmuMzcT9vuJ1nB5due05mZtx/L5++gcH8Gnmynz21wC5eLKa1UCFdrpJz1fxP
	uKXSSJbiggqfMhBbDYNd3BXegQB63sHqw73iIEfacfjZ8QjbZUD95g2AflxSx/cvoVyXfdGd45s
	GXFC4959E/X3ZGwKp1ACzRmbFRQGJgfBim0mFZfI/g6C73VpDeOwH2OHQbydInv2hx/Jvj0GnC5
	gyUVa9n91C6udTbSRfEBBHhU5nufl3T3oTbK1pw4/+jWf4XTH2HVUTifGuq5/jg==
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr1793781085a.28.1793633703561;
        Mon, 02 Nov 2026 07:35:03 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr1793774085a.28.1793633702987;
        Mon, 02 Nov 2026 07:35:02 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm525422535e9.15.2026.11.02.07.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:35:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: =?utf-8?q?Lukas_M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 15:34:51 +0000
Message-Id: <179363369156.2770975.5059354905602709812.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=jj5ynubULAVAu/vUXiY2INwFxg640o1bS1NRlUG6T9s=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBq6K2eQZLbsRd/JAokYaR4x2+9Z9XOiqMr4YVdz
 ovfRMitxWaJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCauitngAKCRBjTcTwaHBG
 +CvTEACbcal7iXqqAofGdmicRl2cJsLK+DwAYyJow3/HSJbdlFA5va1OP8Ytf8bRLS1iUgaA16K
 AV1gWuLCzZjrMgJLrJNZOIyqcQcBx8xzEk/NeDMJMrK2WCbPdqZbvRlsEVJZLXkOivRE670I4wR
 cB72Sui33FEaKL41osPIb6482bCZhcw2RgaueKTgNFrXt9iQpAwyTt+FZ6utm/pkV83hdGQ3jdp
 NxK4UXwGPWFmoYBTmehR1ICIlPquCQ4Vrf6kp2fnqXnkxOaWdgO8X1eXigKat1DdBTxf0klkZJP
 o9DCmF5/qH9o2hN4GDU8eQeTYofKETV5nkD+Nv2XZJhqyddmYQMfRhIIdBMNwVUhQjIqSftiC4A
 vDTTusS/S8yrceGbKn7UeF/9xo9Xtdy2xKihi7CndzcgnGDhn53biVW/XWeHvMiYerEG8tGSZcx
 Tcm/orwCRDWVmy6ZnbQzZ6ah2oejzYc6lTPlG7JveAQUCTT/LQrMv9lnWkj7RpdA+Fl1JfJXumC
 hhSgIqIn0KU1+oZekx1BRdQSXI0lYcH+1a11tJMf4REGPWhB03Bt7RMD1FvZWCwgegz+3sTgyfF
 8uZZDJ+qH/YmTmwgHJR9As7GzYMwpc9+DNNVi2j23Qui5gpQgsSw4V0qOxJSebMRzYIpabpb6Pn
 0Bcg1Rn91uBQR0Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8ada8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HiTqMD5rzcJ12mVflysA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX5qaOHFcC7k0k
 0xdjgTjYcCPjOTcN6vCVwS5Lpj/uF21Bn0nRAhmormLQD928uvZYspV5dv+2MA01CW+sXn6iX60
 DsZPVvmOp32JvVHVT1gWQzftZ9ayJVgVzrCyBNP/SQPIdQ3ogzfQ5XEYOHSP+wMczXkKTWaq1I5
 lWLNBpjOL8w0a8nRrQHaJWYNjRqVpHSjXTpKHM7Av/DSXoCaek4Ot8W5rs3uiGOHcF28asn7Zxc
 pSiQIbq5ZbMlN7jaTTiNQ6297CSTOntsHfyFKgfuA+78GuEEdWZ1RE8+EbGZkptCzg4yA74g7XL
 ejDYM3WNopmdD3HLrHpgI7NZ3PZz+CdIVf2uVqT4o+r+dIeJ7cpfLE7Xty8OScE23uD9dRTwlWX
 qPM0K89Nju/ZnQtUFUUGr6qJzWiknlGyXq/mkS2zQ5Q24jt8jgZBbv+HJVR4xTC1DOlsDTym2yY
 wf7zsQuB4Q/42VIRDdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX1Lih5vXS9Y11
 ZjKPPvqD2scawNDRQmnoNugpLbXAuF0Y6njAxR1xiSh86xMMCf6ma0LxHddha3tI4EeykiaVcxf
 5orFVgxn2bxrhw3CtBLr6L29dqiS/BE=
X-Proofpoint-ORIG-GUID: P_zLuBpyimlYch5YOze1QaWCMn6uKZ7u
X-Proofpoint-GUID: P_zLuBpyimlYch5YOze1QaWCMn6uKZ7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020062

On Mon, 02 Nov 2026 15:28:12 +0100, Lukas Märdian <lukas.maerdian@oss.qualcomm.com> wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

