Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563364;
	b=GuIQ8lHwoubrcgMMUPwo5nxdj6Rq59QpdqQrrogDieiB3EO4DUuAUDptQ+kR7VsiXtCK
	 cfxO/j2kG75+Za9yYEjgG7x+8RghYRYn7RosXSDNDcSVCiQSCVgdsoe4v9MdPvM3Epl3x
	 G5z1J27UjcRaDX7j1WylLaV402oihn04T0lsPU3jtgH8vz96bNwf7pUlIzZSWQUfXWfTW
	 4TP+u/HNj9torhAAyct78ohMJ/YX1glXoOEdeT+5RbKW9r0TWyUpprhXbpW9Mrb3mA66m
	 0bxB9Hs8ZUYYa/FTfVi3JecJGynRUPsOCPKUim4rwlJruKbLjByEz0dOTBVjO+9V09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=;
	b=TQ1xVkNwpiiEtCrtbt8VzdxGQizpYGG94UqcSELFQvIJlxlVwdbsFKb7XHsIS0YEEqxH
	 rThjaFMshabnBKB6fhbrlsI1SFoto+3uT2zD2v+5qRrroqx8AtlqiPenfVtPIsfJ28OFO
	 hAG9fYW+aLyraq+I61czqSgfEAi6CQ0ugyUu2LmVtkYp1BjC26SlDDob2GefdvcwET0Lk
	 bzG6LFxqJP8SQj4VGNSNc3uoxAGyeDRsUxy4NTrcvXzbv4j+mzCwSNddMlRgdaU1xQDpy
	 7zZtE1kcChs3FA9tMqPOdKylljq84Zz4fhEEqzZ4CsnQDFv3q4maHUFyaQgfFGJOFgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gofb68I8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B87HFIY1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C96606A32F
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 20:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C96606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gofb68I8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B87HFIY1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQADn888139
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 20:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=; b=Gofb68I8Niiwe2qb
	ahR4nYiqtXB/u0EUAithM3H0qTLCuwGOJWalrcW+H6ChsQdXwouuRAQelKjVT/Z4
	HPdEc8Buo3TAzOI5qNNTkHnp3t74tqUvDUZUfziBudlKZkY7vmS4XPJEgjyoEWw6
	a/d6ouCJK+GZvVoX3pWdHZ1xaFEsFIbuFng3k0ZTnfRYb8s2GQGkwyfop/6t9b9C
	Z9jlCwbP7UIS2HpEcnl/Dx3brmjEvG/lNyivr4NT7xargh3NiT1vIzXx3aWCc5ZT
	o2lYhrh/B0zxo/mvVnczLPtZrkSPKC6qD1WCcpev1x6c3CtALZZqiy8tQHDXKb0v
	8BHTNQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93eky7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 20:02:43 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so35725647b3.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 12:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793563363; x=1794168163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=;
        b=B87HFIY1gw0JXTvs9/NlXc3S/7i3Wfl95psNJeP5nhZUEfbA+FGRtCjcngLSNsv0IL
         KEiJaP5oQGsa+I7kXKCeMJifC0RX/zz5movJ8laFO5dcxle0LxamQoEqQacuRD5AAsce
         Hy0KuGGU0nn5ZbpVfICJ67YfiLiKVUD4rgzmhMf5rIpk8YX5NIw6MfDoPzkSYpFPbcW0
         fxq5peXQGUk3UQtc3c7JwWbKpIsHprYRpIY+csgMIL9Rc8meI+nZcZn/TMu89K/A8GSc
         zN9yg0RAOcKNJU2JnTgzzB1XxkOMg6c3uplG6E148WezkfcOsusmy8P0jydrRuLlHWX4
         A1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563363; x=1794168163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=;
        b=dsuDPNDOgaik6qS9mRytZcM+bS12F418qEHyv5bFxrtmUuotjZso7KEWaEHgCZLbeE
         8cQ367NdpmAojDpNC8WXKqmgRTqBkYKlCFTPzcJtFTYSrhhP6Q0paKmEYqNblT9MLUkS
         vvxKzzS3oUcDjZghjpYkJ24Aw9vuo+EOrXcT2DtsC1u7aVjjwaKqVqqiEqT0x4YjNWJu
         2Zm809IWaDdrhlwsyzdiJDYlFQhFVg2R1MlMVI7oxfDF+9/LuKOUNojK5QF+C+9mfcEF
         WcwEA1ZBd4Jeko5y+CLgfbpn+XYg7KtvJzufq2f2TD3TGZPdC3nIY7hP36R+H9r5dFXk
         +L6g==
X-Forwarded-Encrypted: i=1; AKwUvBzkcIC+EIzWhfhJFIzrcgsaTo6OXRRap165VdEXQ6Xb7Ve+cWQJ5SPG6KT21p4bwKhZhjMtI9yt925F@vger.kernel.org
X-Gm-Message-State: APuU4Z/2lYQWwh1p5oBfCWGZv7eeo3tF0sGbNEomP2B2I+YfcGivH/++
	BFHDwsCQPBO1F1e8sCYe9wkrYT1fYlb2m2seq+K2p/IXP+r+ikHAPTjmuQI28aaDoUAgR0UXPX+
	oXAOxKVzaf6fJsWYgVKfPLnS6+Z/rTifApdZ7uuZ/M9nasJGm07LGrhtc4onBHGlI
X-Gm-Gg: AYBFou2Q0jVOztW0W2+E1tUSbibZjNXzG1cAXr3kVDXpNdFLbPwJfrj960VVgOIEaUY
	AOSWppkd1wc+7CxSZzDt8z3AX/+XM9YRdLcZj3FbNVhrYyUvkrRL6jiVvNcmjwmvEoxVlbwfDXB
	LLab7ATOuzNVy66fPFlXZtX8koK8ucSavb15zCc8Y4juZfbRC1jxkNxEnBVXrmXLCmneQqskot5
	vZ1QShOR6aoBxbngcRzJchN5PmMcE1uLwWgUeuB5zGCBpnaWmJ8SiEYBLtOp3RnPbvvJnXtJxIn
	8DNhSw/Fp7+FwBpcqEZvMiC6phulXjUuOSss4GdJHK10Q6ouNT5w6ZFQ0FvLi9G8Hl3ltTwp8l6
	0LHTFLU9VVEGywDCS+I+4cftmBAwQglRKtFUVBFtBJ6SB4FR+E+0C6978Tc45Hzyxtw==
X-Received: by 2002:a05:690c:3481:b0:8b1:f47:9c07 with SMTP id 00721157ae682-8b2b6713e63mr56500877b3.25.1793563362639;
        Sun, 01 Nov 2026 12:02:42 -0800 (PST)
X-Received: by 2002:a05:690c:3481:b0:8b1:f47:9c07 with SMTP id 00721157ae682-8b2b6713e63mr56500697b3.25.1793563362213;
        Sun, 01 Nov 2026 12:02:42 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm41034807b3.36.2026.11.01.12.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:02:41 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 12:02:36 -0800
Subject: [PATCH v2 3/3] firmware: qcom: scm: add HP OmniBook Ultra
 14-kg0xxx to QSEECOM allowlist
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-hp-omnibook-v2-v2-3-1b99767deda0@oss.qualcomm.com>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX9v7uIJUJ9iGL
 kofb5GJZUBdhUXEErcvFo6UBtsZ7YLCiNnqA1kXPvI/fcezSYmEyU1JiXlvrdcVt7qt3pMSmLw3
 yKoFEBeChWi67Fi5J3e+0c0QVIiFXfodLzbaMS6DAqXIXGp5wMRqiA/rlKwk5hPAaFPI9dIu4Hu
 dm+9Z1I/Es73GAcuYpRSxKQhQHLN21PGnQwixaAUx/aNEYrPqIfOcEIztSwqdFOBLoc8m0YzZ6p
 RABGk/67IY9BbrpbfSKj4c12/Iz2dUUv3P/EDk3C219Cmk94aupL2B3EKEDOh+AJQLQHXzMza5G
 2B2bZNM81Kf0EjIdePaoTdm+fZKGrhsSgDOEofLg6oX01bLLR9BKQeiMNXYCZXik0Xol1z4fHms
 0NVKuTBtVs01C6sC58sFl0YTWSZpPJQTmVMA10kBNEA4Kkakh7YlbnizjxNrO3D65I0UAWJGW1K
 awBNmjnX9dcKZdf2OKQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae79ae3 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zWXkJhVHaGWV9AuZZCwA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: YX2Re2p9XEHEaAU6vFWj4LXMDd8rU-0m
X-Proofpoint-GUID: YX2Re2p9XEHEaAU6vFWj4LXMDd8rU-0m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfXy71nFo+9RYSQ
 0usyOtTFwsYo66qG0an4UqavCr8QXbx+05Y8094KTfL2rvXQeYV1gsbWG/llJgVzBV3LxxY2ime
 yrvUzJ6mSGu6LtfSCwxz+43hO8Ur3Ls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010079

The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..7658769425d4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2238,6 +2238,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,elitebook-x-g2q" },
+	{ .compatible = "hp,omnibook-ultra-kg0xxx" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.47.3

