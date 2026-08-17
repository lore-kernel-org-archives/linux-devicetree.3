Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1043DD851
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979366; cv=none; b=N7LZHtZaHVF1I5dtC9UjMN17QyQzHG09HNAY2GM2Rqp7RT/5oKh9hEGqqa7ySoZyO51N8oX3BzTy9feobWPbB7S9fEohU3OWQ4hpi1mlUtaiclHd7x3lBflIuWBrWnkJM5rLT6J0TgxEG+17S4xDcjvlty6rFRAxTCgrseTrVug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979366; c=relaxed/simple;
	bh=jgf8SXZZdg8yn7G96UMAuhh5WZwvNapKXO0ftwAr1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvXlaHHvikhPaHN8sH3RkppY7hnnRq6dJFxyI+fee1RiFPLiPbgfe979WPn9kr8Y5hc4FcoF8EOszpdFOJHgsyPj7U8xj3WQYy6963q/IsRy3adydw/SrWkuHjS08BlpMny58ULZBLTK5ZPOeWNk/w9KhVuC6FH9nwapBS84SlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFNpknGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+8P8dDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFNpknGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+8P8dDq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD64pc2238938
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=; b=aFNpknGkKOtel48o
	di4WhHWTIXkUUjvdy8PqX9QoUl7UcGRtp860aJC1aUdWiS1MBdeP0pwZHfxkKGMH
	CCjtWFQy+5ickmg2X3YarM2QIio/t0v4NJ8VpIMosLHldkczdpCuwJdKNQS1XiMk
	/bPMxhSPmMIE+10IuWLpFRkszlIqRqh9wt7Rdy4+ujnlh//cn/a5wiAmXWLGTpQc
	FyBqcCoeuD7ao8lmd6WL7YMykHRyg5SAhslOBuPNZOhgHgYbhljC0IYsxm9omIfe
	h8Ou18ifl/immbR8SWOoHMVfvHCJsIwuWlXZuV/AXTWf3NlUJKLbZ6S7NgXFyci8
	7BUMeQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk9hyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:20 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66ab1cf1cceso10391468d50.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786979360; x=1787584160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=h+8P8dDqbGMAAOMQlnLLyVRtFpS9dQ4KtZoWhBV512T5t+m9knKlMGzitiIHgVzScB
         LGOnkqTR2hAKSFwSTD2nSvvcLR1JBSSZe7TCU4r0J6eyIpeulzVC76qOvAvj1yrr7SWp
         C9MK46EFZhIQrVaeL7j4ckXXLG6kXkzG+5p4lZ59LC0qumXrSiTnFxtngtcHEZWFjHox
         Sf9UXYuArRTnXdGRF9XbqqAUTAtfrEzvNnKRwRKSUn7xtSoZJphzt1jEyTNZkJraOxn1
         9KJ+lfEhlIqylUgG46x+PtnHOH3E+ie810UOSWDjzQssmgHoOEa2EXcju2rzZgs2F8Sv
         tIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979360; x=1787584160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=P3rEUKIajUytahTvEjUoMdI/BcAdQliE+724HWyjUjq62A+RuTDkYebpJYAYdmao7X
         eIZG/8JyrAM/d62Lf8OxTkPOuGrBE0uWGeihDXRMbuRnjuSpINO2IknafWBVV6eT4/lO
         Pi79Ai3xH8vk7/SWoMiHsbgknWG1LCix8J6eNLhbv7Xe1lARjuG6UGxRp5J1+K0CN4az
         fLtzVg7OOf3HLfJ9pGB4s8uxX7DvQmkqkuaKu+SDcBZ/lLAaKBt1erWVgJKOrDo//ZnX
         i3Dk+AHqN6nkF+MIibTkpf+U0tHP8afhvjAgPKUXXkkhCdosmJAuoPqPXj953+2WeZFj
         L6sg==
X-Forwarded-Encrypted: i=1; AHgh+RqoSvv5B520eh234CMoyr4x7iMOaQVwDbK/OVzrxnBxhewyrp+WkhL4WA2N+xKQWy0TPhiRWVvK+pvy@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHv2bBUrkOFh+1MTnmJpv/4TLMXiV4MUpcYMpqX/KiP+MprAE
	lr66ljohKudDmhJw0YGII+0Ynjhl3JdWUFe9Fp0Epdi6nMyExG1tFMBTxFXkJjTrZSqVIWJVvhK
	acOX/O7y5RQmILCAd+3nUSm77jal0FkUBzv0BxYHYP5ZaGphiRpyt+UQyAj6v47qo
X-Gm-Gg: AR+sD10ydyrd3A1o7BgY1Xtye+AIGWcJOdYV14kTpk8S1btOfhgpJzZpzvPP2PghHJv
	wmyZ87QwSNN7TuRxC7FLiRGW27gG2YfGiptHZ/BtTj7hbaPPIFTgi8y1dEJSAMa09EJjYN6sGpg
	07wKB9Y2so3cL32SULUJjazgEcCMqcct4q2XNt9UNgWFxVl+uP4FqtFFgKjlu3/5udfOoF/JXkJ
	KGadSw/PY8ABrb4m3ch0uCKTIcf9qVV0If/kqz5OmCVtez7+b+5JkGlhLwjVTMHvO9CG65M4X0s
	jJWgrmgSHU8Bm/Im0YvC5dEN4IEI4lLnbLxu3LDMxsW1LiIIDibI/nwnRNhptzH4r7vr/zbByig
	af/BnnXiX2HFK6/Uki96g1cBkUTy7bxbgKPXf/29/ATz1kK6W2A==
X-Received: by 2002:a05:690e:e8e:b0:668:161f:c7a4 with SMTP id 956f58d0204a3-66cb9de5339mr458790d50.23.1786979360035;
        Mon, 17 Aug 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:690e:e8e:b0:668:161f:c7a4 with SMTP id 956f58d0204a3-66cb9de5339mr458762d50.23.1786979359621;
        Mon, 17 Aug 2026 08:09:19 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:2c9c:bdd5:b705:b119])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb3d377bbsm938108d50.0.2026.08.17.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:09:19 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 08:09:11 -0700
Subject: [PATCH v4 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-glymur-send-v4-3-3fb89cec703e@oss.qualcomm.com>
References: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
In-Reply-To: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: fdANcbvQlSGqbJvZZr7Dz8XKniTL_QQz
X-Proofpoint-ORIG-GUID: fdANcbvQlSGqbJvZZr7Dz8XKniTL_QQz
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a832420 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfXzpSRdE+cipb3
 bgKpDHo5Uo+pAgaGR9BxUAHuWU+TVZgRg8MHH/oYpmPerfDPK3OFwBVFd4AfAQM/6lw1FSxtQ+d
 S2YZfoZoaObdhQ7d0CviTBVjMuixTGczKCsvgfJUqYgorqr91P/kxJi/nDzeq4bjQROEBp7UqQH
 22foF7ywCmCdWzFp2udGn3TQysniaZ+VzGyZ2OiAz0eZr9RHEaTUtIEpPXgdHE3rL6+bian5oTM
 IOT86UoI9JYxa28od006PMqDrH3elDmbeM1e5ycqICK/HBXYchMmz+6n8CJSaEssMfMRcCQtt3U
 +Igjr1vB3/tmlqz+VNxzOUWsW/UA5FTMo4UVfPbAFaM/fWBlmD7IAOaa+lTDUXl2uZw1Gvvf0fH
 ZH1J22cI6XF8Q+2DzHwjd6bKUIx+KnQfYffyxlDlDm99CkOH4iEEynQQBq7+nYLi6rL9sBRCEXc
 avoqD0rIeXxgX68fs5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfX3oFNma7QIa10
 KwrdtayXx1w8gAb+cVx6/Bwx5qo8T0GfHUHosAJn5TRWvnlHX7MMgSmJcP4Xm9I6oemyRO20INE
 KLn4yVlt/eGN6rmOvJc4S2+7bwLpQf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170116

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..c44c63e1c20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2311,6 +2311,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

