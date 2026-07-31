Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EF3624C5
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478494; cv=none; b=dv7eCKWTVm9futEIrUsgEPw1hUqbr3Wmq71781hMAbC7PE32BaTo4lCmZ5J6ck99V8rjRFQCpo4Q3YwwAPfdTNGF9aMi7GeQ/rGqM7a83WBfyKmAXIGSBFrVHs3bOvAz8hAukkB8a1ElhfXeiXadk5Cwac4XpkIVBbYVgZ3AuVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478494; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1N5BDUntOQPe57ZbpyYLv/oi82y0Yn36CgN5H6lwhPPMnMwacGGTDdvgAEEABQUh2FMu4+D7cr8NxuOEdDLfZ/AYeLEbFYCdQ2OZ+48K5s/26FtQ5bvIIVLjP8B1yzQ6ouhvwDJC3uiWunNurfXLEjxQuTqtSWUL1oL1qZ48Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pfd7Ddor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMMs48dx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pfd7Ddor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMMs48dx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67Fwe2960557
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=Pfd7DdorZWoplyqv
	WIS30HtwS+76VWExerP91QFOjnUNJjRZyG36ZY2rF+D7KQoWL1pwsx0HTCUO9Qsz
	ou7dJ/W/fJ/H/8fyIXbzxZ/UEay9VOcmeDN4N/p6woo2FVZS102FsZjRpGrgV6Xp
	ENYADZDWn7NbYCY/h0BG7mrWBIwhR+5fxkFw/oYVJSC6kEr3/QHMCeWf0rpDb0o7
	FCQ7D8ab3kOgm5SLKEI5jl/je7nSjJuoaQ6ReweFACcASHzNDL2SPTGBXfTyq4Hf
	CfPEGv8FGZO5zDuMB5+trvKnYAJyfgI0xZl47Pklm+4+DTcjWLm/pIsvhKAEwwsr
	HNI8UA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5kg0p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso11339865ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478492; x=1786083292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=NMMs48dxggzQdtOLbT0YpVlzzrMW3O3AL8pFBl/73QVrHbMdm63iBECVUme2DmVcX4
         BCFxbpncPBpnx+SymEQi94euxzW2J7U1nl7jSRRGmRPzoIgYk6Fnhhu1bd72IXhGtBWh
         h5opjJZvMUXnILQbZlxPLlS8yyVIPnpPnuvyotDrTM58v8O1ilcI2DGeRjIOKQ0vBsSF
         wtMFRa2aE3VeAnEOmjezaWBjjI2mW+Lw8wuO9GBiQRIK5/TkVg4z7uns+FxlzrlomMcq
         +C538TyCXTpzs+JqB6XRFCtsilLk2+3wnk1RxFlzW3z6i+m46YHxg5+GchxQWrfjiYWl
         Gwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478492; x=1786083292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=maSI5AHCZPZ+dN7il8fb8AxCS+P0sYT+Z1tonkUeDMiF+qfZvPB+1j6swkaYRfFTg8
         hqK0XuuuCaoiSb5irwvSnNUevKURs5Z/FMcE7IJRUZ0C0Mhid+1ZqCAF/YY6BA7g1obH
         Yz2CqlztA9Xc44IQocEJyzPchg50btRGjcvnRI6aK2Qlvb8dDDSuoOElmNqOXfxH/j/E
         O97Oap+t6c+XfLh5IxUyF8b6b7KIOuoE+mdCRCWduMETFEbiw6q3ZK/YFmy4Tk7nmfzv
         RTP/dWHjjYuq/V3ze52ELTuRRV5vqlq8TLihZrbOfOGldxW4kuGGQ0NN+EoLYW77Otjm
         +Oug==
X-Forwarded-Encrypted: i=1; AHgh+RpMrs+Dbf4q/CA7BcYTF0OBapBqwNsT+2E/qMPWeVx9JndhhhHP4o75iXBPRNWgK2NWCDsGUdd/DyD1@vger.kernel.org
X-Gm-Message-State: AOJu0YxWalv6SqrieoPew6dLGcc0WK7wZLk2GFnLvT8RsWz8KaPq+d8+
	dx+MwLaJzw0oPFNfO1T0wMuTsUjSPF4Bi5BiGnupJJ2xfdp8NmeybCuGrmcCyHzdkti3U1dBdt0
	O+Zm0Ih3eSmJhLC6cpH4/E0V3rDCNZ5OXV7vjXkG2Fh+d845xOSNORZqP8DoWx25B
X-Gm-Gg: AR+sD12s9fY0DL59NNHuLAw1qeGKFIKXVdK3e83ndT2Zruo3op0RG3Ma+PXp7yl7x55
	ChcoWJHOlEGvadbx3gWcgqh2RcniGrpkd5y70IbWEObcCVeSzHePgybOESUefr1EAqTqUDX9He+
	pPaq5Rv0B3P6i81Gd0IamKdOx0ub2lgxL/8mW1WxMZpaspEABv89rlthXqCcJp40Y0HFd4CQVWH
	YeuG4Xgv2doju4KeNepxEIGWNm/WIwbHcjgmFHizZQJJNpDL+U7PUgXHGZXQsZLuX3s8qqb+i/h
	TJpIIUQvxcRkh6jy5o6ZYUPuoni+PflK293iySLcL7zyxQ9P7iCYJ6gEZ6ml2Ziha0LWeRZLO+Y
	Sn1mdjGJzZKiIDu7+rEw2l/QX9x+a9NpYof3vRh58dLm3z8UTUl/SR4qeoOkrQLoq
X-Received: by 2002:a17:902:ec8e:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d046de6e94mr8722145ad.16.1785478491798;
        Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
X-Received: by 2002:a17:902:ec8e:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d046de6e94mr8721935ad.16.1785478491422;
        Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:37 -0700
Subject: [PATCH v4 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-1-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=vN7Rr6KWaUgIlMGb+pY88D5N04J8F5vTQxB6hGD2Vq0nZl8wGHBQHz9obpSIx03yNTGHdNB7T
 TT/CPAeQPLIBveikhhd0M+6dmT5EOePL1U0D9ItL+GtJnbngSbRH8aN
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX1QXsFVtI5yiQ
 OnH09OlWeuKSqoSp9MMW0XNyLnjirdtXbVKHccu9LIiUUJCI0ewe+78JLPlkhl+1pmOgXyI904M
 s4zpDzhSJO3rkZ8kRsLoVrOa8VLSCG0=
X-Proofpoint-GUID: dCQVuPx-9oMbuoXxbAUXIwasGxL2y583
X-Proofpoint-ORIG-GUID: dCQVuPx-9oMbuoXxbAUXIwasGxL2y583
X-Authority-Analysis: v=2.4 cv=c/Obhx9l c=1 sm=1 tr=0 ts=6a6c3d5c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX0lhwdUxtKbPt
 Zf8KqFvbg6PSVTM8MIwFIy5pEf4F0wTPN+TGaNlmFZXT7eNzJGrVTKcKJRklsQSuqInUrKhRwzB
 hzBpic+6N0U3jK3UzzLFzGvKsIUbklJv47oZHnq9aD8Uyf9QFzUGZmt4QBz4xAf0K+igxEiPIIc
 tHxaxXRjOOdxxbJR2/UY5f07RXQAN64TiYNM6Lxyi9sWSrN33HsHiW7vzd0fFoA06D0y1T13pkV
 3atzmdOWFgGnKLX7sAkwc+S/uWes4k5HsrbmZqA0X//22/wapSJe2+kaez2V9kjCTeNK61MWURI
 r1eD8LDzGes0w/S8uid65RhJoS6bt4cMTl3YaCXdR/xmBAK6JhWCk4yxDMEk9ED1EHEsr/NB2dj
 Wezhjsuo4qMS26JWYC2sA0ctOsmaaB+l1rj8vRFbvtH0DxmBQND49K8z6PYuoGxmbBkBMFcRJpk
 xrf+exunqY7Yi6oUy1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310040

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

