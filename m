Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912C2BF006
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628336; cv=none; b=YnvbrWDCTk3rCaBr9YTg9KEtwsz8zLHHZOLngv++udAX8844ASws0Nw1ClmcSidC92azxJ3X3gXr8IHg6e5ZPQjbLPkIDZSrE9YkWcLMJ8NQIQfQjl3I7ywKCj4Tbp06APOwOf4+O9KKbMry92h/sB05ZPJ4P/Y6Ch9Hi78i4Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628336; c=relaxed/simple;
	bh=mDOKiKjD0SsH0fUKrRzpofcnlxKOQKAEDUyFaKqfPq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ij08vI5q5iRKXu91YYAMNlPWa1E6KEp7bD2nkPDZvlEt0m/fuc4a96EhWQN7ITohkUYD3XRdUODnSgTZu2w5EJDiSGRLe2mbgzj9AsffFttd5mBYBEhTRhkDmZsuch6AkCtkNBl3GhvIr64E700BLIrN12FG+x3HCWgUb84SJNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N61XqqyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsWdARku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N61XqqyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsWdARku"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFoURt1484945
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+54wPLDvzjcJ7ZhEYij8uY
	aNhbtItXghLTwIlPdmdtg=; b=N61XqqyIMvIZj7J7X8/2egD/wlNrgl2fvDMlHp
	rKpXFYGNweCEofZ6vWcxg5/EUCnDA/yK1sPeA5aB/TCH+tPpe/9ptANisAfCtVW9
	engLUJl1P4NH68QFJ8DSzVzaVDuqiADAA6/OsRXId2QEPqo6Bzh7r1meFsdP9KHs
	enEkyI/1dNt/Xct/i6jkyjtkJPj94mYLy0CoCqH+i0aCZDoifQ0YCLWrxbC37jrC
	/i/1/iZahRNBen3dR4AY2/t6z32xuljm1PQxMYEK2vAWZvAtAl0w8hxSpqdu0BMH
	R/MXts2+Mk7NYzyGyp1v83MNd1ZC0CTY4eoFzFnr321LMrHw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv83nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:18:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so62992871cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628333; x=1775233133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+54wPLDvzjcJ7ZhEYij8uYaNhbtItXghLTwIlPdmdtg=;
        b=SsWdARkuwf0CwmCVehTV0TlTS67lZn/8NOXTluFDljX69gFw0KQ/lA/NX+8a/Xmn0z
         39+rxHKwpilOFByWSOYB+fm1gDLLW19AfZ8wUgfFXVcVZ2drcvp4ouFiHX7wzGvkSidH
         cWR0J/Pd1h3X1qNEvXIwmDc1OUwddsPcIGOouArwpEO8c9kgBsWWwdzO2vPEEHTRxot4
         uo+dvQOM0MCU36RIlIqT0hru6cM+QdMjOkRzvjlC/rn+ENaJ7cV+94k0WlvRnxhzHfKZ
         OZFbqpaOWPHU7wtkAU0h5qv5uwM8KjHGZbRlMLyz+2VTRtlesLTuWIZ/VRezuuq2bOgJ
         OgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628333; x=1775233133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+54wPLDvzjcJ7ZhEYij8uYaNhbtItXghLTwIlPdmdtg=;
        b=BRh9CKgbS0cI3yN0wG/CzNldx8UvQy4M8/TEmE4+Ch27RzPNUtkvEm9YaAsbi1pJKG
         0nUj33540pc0qtD9AMFB6wCCF0+NTlkp3tZAQqkDMkUYvk8cL2shyWs6Czf3hhk8hZvP
         eafTEUj2aqttdj/o9wvUMkIZZMbSTofVMvyk6iqyTE/708jvEh8Siz6okTUCypPa1vtd
         s4C8fuQM5BSXIjET7kxT5853hTLYUb75sxD5Rqtx6kopX5JxzXSJdDl0q0grJkRlG0EG
         xGTdIbm8LcEoejT1dsSrm5IfsVOIiYzVywx3cDXbXcn+SEA8gviAuQkTSNGl1IAkrBlf
         munA==
X-Forwarded-Encrypted: i=1; AJvYcCW++vcIqJoOzy8+bMNagDO7lRH2rSHAphAPMfaHFgPxvo80X/4PHtQbSOI/sjkgUcFPaPbvuzYG/8/J@vger.kernel.org
X-Gm-Message-State: AOJu0YyMF1LQkKrL/fqkEDcpstKbYtrOv3qo/OW06q50NtI/bZP+qcE9
	HgcJ29qvIvpOmmZ9PgELLzfACso99dfbzDLCKSSs2QerHiBVc3YNp2i3va4rkYQRLn//DSBKtBX
	oKhav8LADfNDFcMsYT3/epGIYOkPCiLz+b0FPUg11FdvKi6ZPFMKbcW/2SwVKqAbI1VDbCJM/
X-Gm-Gg: ATEYQzwwcNeWcs7oTvG+oXqCFj69JAdP5eE4jUO6FBHbWWE487k0C4XP8Y3m640aDrH
	6ElbwKBLEw0xf3oFdA3c0o4DMFS9+jFdPEXwOes84ATsX2R+gapImrh7J5w5TB/0+OyZBUFSZs8
	CL+XXzAvj14qzqOb/qKkrFzKVdMXCoNUYuaHcsJU8dhu7TS/6v3gmKHLdCKV37UNtCDmNDQF5mI
	BbVWKsylzOgC7JRe4106lbJ2mUk+sckz5LYXTn/rPFjBhKE6Z2IGMWmHC/xzD44gIDUib0in9pm
	2q3aWIaUlUjS++bspe0Ugnaf9dTESfslpOE8ja4VnH8oMiac/A8jj0cX9iitPh5mT3juh/rBbR4
	PqYlJ0bUoTC7YFMi/KTotaxX0Ks8=
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr69757421cf.26.1774628332931;
        Fri, 27 Mar 2026 09:18:52 -0700 (PDT)
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr69756991cf.26.1774628332408;
        Fri, 27 Mar 2026 09:18:52 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: pas: Add supoport for Eliza ADSP
Date: Fri, 27 Mar 2026 18:18:37 +0200
Message-Id: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2txmkC/yXMywrCMBBG4Vcps3agjWLAVxEXufzVEW3CTBWx9
 N2NuvwW5yxkUIHRoVtI8RSTMjUMm47SJUxnsORmcr3b91vnGTd5B1bcy4yqJXHIVnkMPseY/JD
 9jlpbFaO8ft/j6W97xCvS/J3Run4ATkLTFnkAAAA=
X-Change-ID: 20260327-eliza-remoteproc-adsp-fa7dbbc71d74
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mDOKiKjD0SsH0fUKrRzpofcnlxKOQKAEDUyFaKqfPq4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3fzc4O8uQ/HkjYu6bMYG5dRmE4is/O3JjAf
 68h2PL2ATiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat3wAKCRAbX0TJAJUV
 VpD1D/4350o4dqP/nB4w32wZ1ElcbMBJvtCO0JOgEKEUzNXX3XtbXw6y3zOUlOKrDRMghdHR5/f
 +TICk+eU2cp/fkV0XPsbhIqKCZYIlxr7laYpkNWnQLuHY40gNA43EvdQd76qLwtzLgs5L+XKSvN
 /HLLsXaU9XG+eOvoBM+GY0wRmZ9ombMJgvKSnWRaEl3BDQH+5a9IDmausmtH4YWIB2BzjjyRZvo
 3ObN4MlrpvNr4XSB1jWlaWo+GBsPGyJK/zubb1EJmk0eU2NeDjvdkgtmY3pd0rQc5tuQCcm8oHY
 VIIlRRKEqEzXjletULVDlzhoNPsdBKozcyrPYsu7kO0kSI7ykvr0Dvig8ThwfxaCIZsxMVER7Mb
 7hRXm052MEpL+InBONqAEHBtcmrZpcFgH5o+n8u1Go1BH5lRj51OeZzRrh6KJupkWeKVqOvtbRz
 Kt5QjaffbcAGDbA6ChAWLnK0vSvXyKotEICR/4x1a/Tf01XxqnXba+/qecE4JYYciWnMQPg2Mob
 at1mVXEbwOvoU0JVRF4CyBz/vd26PqKNYjdEeKi8++l83BFRIZQwYwxuhPu4lz84STlsocHdOQP
 GJtp3HOiYI24P6GgwORIvLbHnmHXq88mMhFSlqBPzwCorWEVwqWDpVW1JDoXy3FyjIWBjSeBxjY
 xPa8J8TujZ1cOqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: zZG9etrR3b81dnkFsW2xEam9si5DaRR3
X-Proofpoint-GUID: zZG9etrR3b81dnkFsW2xEam9si5DaRR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX22WLwEPjd6nl
 IOYhvkmI6bQdIthWrxtq8RCjZYEjRRDVwAQRwFssNlbRA6aXk2taQSVZq5fGBjusE9gIOs8zg3k
 sfnlKotFa2uDIzP80DV7HjkUI1PsXXhVKMlim/qm0P+KCy/K7Pe7nVwuV3tSoyvLlxZBMHnR/DO
 M5wtdYracEO1GU4JolNgDHvVIcYoGiTCZituXUnLFcn8N2lnzdI3dXydhcJuUJhherpLwOc90sm
 OrlKlVPS3chfR9QGKxjSzgFUuSY8xqMFiNwYVWEG+dlU7p3lR952ReCfVga0bqnFOnji7Igt5qY
 lL1ZG5Blap0aB2wF+gpwTbnl3GfZBXqPxkbrq4VQu+Fw2tqIykBiocgm5WVVOsxvS+tCFJm5+Iy
 P8SbvD1l38rVaf/FaPrKWR9Gv2Wyn/VpdI32e1bLlX+OM6xsKIBwE+v2YjmcMo00JqeSPJMu+kA
 DIPtMQmuwYxOvnOqrnA==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c6adee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_2eu1SGtFr4sOAyhaxkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270106

Add support for ADSP remoteproc found on Qualcomm Eliza SoC.
The rest of the remoteprocs will come later.

Instead of adding a dedicated bindings schema, just reuse the Milos one
as bindings are exactly the same.

Then, just add the compatible and reuse the SM8550 configuration in the
driver.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP
      remoteproc: qcom: pas: Add Eliza ADSP support

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml | 3 +++
 drivers/remoteproc/qcom_q6v5_pas.c                               | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-remoteproc-adsp-fa7dbbc71d74

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

