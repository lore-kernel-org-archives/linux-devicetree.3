Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A900501286
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677904; cv=none; b=BMS8Seh1RvYD3mxUJ5kMrHKl+7Ii8I790oIkK+UFHlC0SgqXz4gegqdI1XTW6mmVKNHHHsrmwsTMhfWr2ldCHpdhIieqipYqsXzUjKgjh0rCB9hb3nYQaVsdIYXelfh80xRHkAs9bybsaD/1SEddFGPFtA1Zf/yjrgO7bRnpIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677904; c=relaxed/simple;
	bh=6Zboq4cT2y84yPYufagiEkEzfccik/iBkOyKlp5pXB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b5YS5PsLOu6dSwB+pROfusdQj3VjfcbIpJtEHtLDJpEJrUvce0pYDZ/j5aXvECEUhCRAtRkKEdLZb2raJ63cDX+UsuDtHviFghA32lyGkagVlp+5fWOCGgm4beSQrQAm3lmLv8+sZJY6TnLm2NJ+aZ0rzVAyE4ZbQX0TDDITIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Acq4uM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc90gcJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Acq4uM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc90gcJT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAUXqw3624286
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WuBWHHToL3K7RwYQNdbWwY
	+nhIh7kIQTyJPyvxEIHhA=; b=m5Acq4uMj1KHvZGkR8kFXaqrqXg7eo5p+fte+8
	6bI3G8o59cXGUWCQbTxg+aDnohwSY4tmAn9d1OicbSt+WAnkrBbgwcQ0L4WKmMWl
	MZHtUgkzcnCGLU+6rXCjXHh73bOFMhvVQI4dyWYgjLwTb/69wiil12lhy6Q8y5lx
	AqSV8Ab+8NvF0ienmgXObOSnd3a4nESS/C3JGnNdBYETtwUd3U02ubx++wwpfQNN
	9EITar2pmZoSFDiyzeI4/cQN2AWFapG6O3lO/AYVxqTdAFCW5zu95nmLK7sCoEKv
	ZXURuvgP8YcnMrUeUtwOuZNlcvWgfojKhk6khDxew+VFmTQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1g04p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so1906555a91.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677888; x=1791282688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WuBWHHToL3K7RwYQNdbWwY+nhIh7kIQTyJPyvxEIHhA=;
        b=Zc90gcJTr+n2grhAgnSrl6tRcVFI2tvsi9YxpFUsIuIxlmNhj+uFrM59aghW6rt6Qs
         QzGAQRMBhr6ikJD2PIUkqWq3X4e1Su77/HByuIaYJebiLtvaWZfowcPRQFVyXeN+ssaf
         Lbbl0K8VQ6wIhT5OMCBu6foY7vJxJRgYmw/ogpkd+j5inCDpMZRR7Pk2NcXrY15cAVsu
         ew2AmdvcldCef5i9oC03r3P6VkqWJVxulx5gIFOdFcrDL5F837BF7/Hhl9jK3ROiEqkW
         jxo3QIL5dL8FDI1MFSYDjTItAtLUIMrntFwwzgRM71aIiB6YMTIiKWxObFMJDD+0xj9E
         ULhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677888; x=1791282688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WuBWHHToL3K7RwYQNdbWwY+nhIh7kIQTyJPyvxEIHhA=;
        b=j1Wcank5nz85ioRDVycmBGA7ba8VopF5ypioXkUuxoAw8LFUrNl0DDBDXcid9lftHV
         xFyWBzf19ChAcCISloV2VkPm57lb1LZL2WJMsy+0WsnArgJ/dwqA0iSgivh2H5W0b6/R
         CMmkoL/hb4KNVhgKjpHM0TcSmX8b+vz9BJJMEuu/RDF0eHY6OQpCc72IypQZlzbiubLU
         Me08QQHPFlZ18ZGlOtKcDgQ2tIzMp1LL/44zmdRZEBQHcbavKXROBYO5ZwR7NUFmP09j
         gnkGFICCwIH4bnhO0KVu0QpT76lEdbZSc5ZE12C4xjQmPRou8zgHBCplnBh4oxHNkN9O
         tA3A==
X-Forwarded-Encrypted: i=1; AKwUvBys9xqCaS8af066jbQn++NyoOJMKiB7Mk9/UN3SWMUifjDWnrza4q/y4x+gCcNOnDXhlMH/b2uZTFfZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJz6oHcTFC48EgaYV5YdJ8c3q79++jFXUmZg1IMUrO/t96+cDcq
	bAbDV8ioBi3UuYpwAalwV77Eesf7cpUWpvbBdV2vIAgo5E/3zp7Egu2rjbdrsrXUQPKNvDORveu
	aD/bHe6m5A7Me6b9YCGA9kOl6z/OqtLLR8u0BDM11X11GPdf0VjPGC84TCOHilYpt
X-Gm-Gg: AYBFou0CDZ+3pccU+uxtsn0L+zOTPSkHJw5NXM04PdSXSCLLyT0ZntLqTBt3a+S4DQ8
	jCO9HIiAh+XyV4Ib++sqecAUcZ5UN/XxyyI2QeMyvlCKYgjpcvVmj1UpfwIKlVR3mDK8c+veqfp
	oTAk+cIsdR/k+qEm/2Ucs6ugwLvb4JW60DSBh2x9BFtuLbH1KnXbpbOcQOCCGyzB+9nx9gxl9+T
	narmAPIV6ACJ5x22LBc28Mz+czG+b13K3WOi4DJy2xlWwvM94UwKh9VN2ZoA5m8lYi3+pQJvVJP
	0DN8y9ULmz848F4KTiRfT42Q+1nKrtir3j4hNlNf55+crocEqrSs7pZAJ7SLNyhVqo6EVfY5pjw
	/SDSBbOjoq5sSXw==
X-Received: by 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr3606753a91.44.1790677888311;
        Tue, 29 Sep 2026 03:31:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr3606726a91.44.1790677887783;
        Tue, 29 Sep 2026 03:31:27 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:27 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8750: Add watchdog support
Date: Tue, 29 Sep 2026 16:01:20 +0530
Message-Id: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiTu2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3eJcC3NTA93yxJLkjJT8dN00MzOzJINUE2OgsBJQV0FRalpmBdj
 E6NjaWgCZ41eJYQAAAA==
X-Change-ID: 20260929-sm8750-watchdog-f666b0e43875
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=657;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6Zboq4cT2y84yPYufagiEkEzfccik/iBkOyKlp5pXB4=;
 b=CPxKRN+SRfNGx9D8zFn3yOCXAefiaCsFOITRfQoELYm+zrFRlpYM708iTDnB/u05hlu2Zp4NH
 +QD+Ex9wD1cAbsdeUrZBZgR5keXDWzrflDLpn0XQFjQ1qVdj5G06pvp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfXzOKwq4kbpog7
 8d8G1tcKtMbu/TRGlKk9aYz2J4XlfFOfm5XmFmPTXN1BrVs7N70o1E5V1UI2HcRV+0ZGzvECaJ3
 yrLT3O0ePh3Yhqkryo4w+0C2F/ZfJ6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX9ELrvRF+1ooF
 aM2B77J83tkm/DHuL1tLUJ0shCT8qg05x5M7CBgM0MDfs9OFZ7e2PPY8UeRbB4yF8qCXtXWLWfu
 otZM7y+UlQO/bJv1GPNitEBMdOqUfALs5d6oKd0MEnDH/9efJuE1eK3Qdkwl/qrqO1eHgrh9L/X
 C8Bn50DXZPK/gPvR2GppLtrtNc2O5DJ4uCEe8fSYSpPviF45SGbDGBkInJwUb9pyGTSYZzYH6gC
 o/Q7IfYapIBlzOPKQT9Wqp2E6tosryz10QCQHkBB0SUPMMokLKcOj/VPvnxgSoOd8ZOODWLNqeV
 xn3cP14bZ0Y+TP8F2+KM0yj9vkEl/CzB6e3oymU9M6KumfVCrYkzyEuFoYJzER1Qp6Lz7XvzbkW
 2s5qX5uvgMnv2ehzh7B52xHH3Y47vVpw2lcuHEQ6B7nnuVd4ZBaY5mbEPQaaF3chvT1RJkonKWb
 a6XpzwQAdmMZaMRFEtg==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abb9381 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gH04VMV99jTEonyKTDQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: q65eH9IzI5xUjhl08WAX3bRaiLfohvdD
X-Proofpoint-GUID: q65eH9IzI5xUjhl08WAX3bRaiLfohvdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290041

This series adds Qualcomm SM8750 watchdog support by updating both the
binding and the SM8750 devicetree.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: watchdog: qcom-wdt: Document SM8750 watchdog
      arm64: dts: qcom: sm8750: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi                     | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260929-sm8750-watchdog-f666b0e43875

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

