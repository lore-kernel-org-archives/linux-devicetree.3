Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6723CE48F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 18:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068530; cv=none; b=b6p+r7ymySLef/golRbwAXRc8Eb+TCHlhi5B8pWhvwLkenZC9Rk6DNCGFsroLzy6fM+4Kl4aY3YyGF8yLKGJ4jcHIHI6hW9qVfhdleQVhU634LutVUr/h+qOSCFxocwnEmYuqS5VlV4TVpqYOT7tF+K0rOUo6gL5aJVWqVAKzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068530; c=relaxed/simple;
	bh=FkLaBjvdHKTXYPcPkiXMXOwDaGBYIuXOIzw5mY0DxC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hgkIretuLzZrXgcRd3Oq9pbTLXBt0v+PFwGPm+3qbkslx3L3ncv+vCYfyfnkqD+l7x2hsLosiH1zmoIx6aGCSIlGyzmP4PU1Z3La3ZqJqRGD16JpOYqjuUf5mYUz5zpXx1pYorQic2cz1kYMGEWdWFSqdRKrCFoXeSLTSTx7gck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9frPfRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVjGYsB4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9frPfRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVjGYsB4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631EPtHM1881827
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 18:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wzYzyqXfnan1ryogw3nSbv
	yTOhxtwYpGaEURBuTEI5c=; b=Z9frPfRNs+uC6tbfISbrro71iBJh8/Xztz5q+y
	RaOr/ghc5UZU7dXJKjP++jVCJwup+82gRJkBc8lIuvu4YrrcKlbH44hONjFumP7D
	3bsiCAxh5S6MeNr6Pj2qHtc+SNKDI2hybbsrlHHNgt2w6Kl8rftrBuiZMakSUzyY
	RcbjOIycSVwGzYHK5VUtePLgrBbYgzGc4LxWk5P/86OQqzPp5BlAd12XVR+KAqb0
	SOaDSo/FH/sFS/G+Tpf6lEGpRY8p3PRPRt+G/eilhJexm7xT5woDIbEirlErgSqe
	Pn9YOJTwVsEE0bywHyshbAt6BNe8hPa5cGJRlFfMPLOh3wAA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954c92je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:35:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249541063so79365ad.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775068527; x=1775673327; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzYzyqXfnan1ryogw3nSbvyTOhxtwYpGaEURBuTEI5c=;
        b=BVjGYsB4FjNYhfW9wAVUolPHEN2Axz1DDZmeh2DYXIo47mAHZrzsb6KauA8pK2BiQw
         GJSqFHKeHTIHAulNHpkf0NfiXoSgC9Nkw/WPXcHP00ueSJu6oR6a0zI5X0wDt36lyDtD
         T/3HSY29SiqzwgvjaRCatL/oAR1CHTlLlEiW4LFN1XNk162BxAHOrRKoZ/GiqL3upItv
         S6rXQwXnq0jlN5+QMkD/kvMARg5SalaAcxCuZtPn+9iH9MHvmPWS8s+6VI2XtrlgqKiT
         JRJ/KgD2q09zZ3nFtrzdr3UYLF44ATbH3kTovQLNAH73KJrHhlQZlOZERSyQyHqZZ4QH
         SiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068527; x=1775673327;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzYzyqXfnan1ryogw3nSbvyTOhxtwYpGaEURBuTEI5c=;
        b=nCtMFm6kSC8ddPTmRy/lewnuDpHKGw+NmikZ23Ij1rMdfK4Qd0j9OpVGld8LyDS6Ib
         rFk1MuTqEz9Cf3AINf69d8ItAjZTA8CMsZc61Gw5Uz/q6Hx9XX1TvwP/YkNv8Slzh1AH
         MaPxZMXbwFL0Yea96/ed6N8dr1CK6vF0XCeBQ0W25K0Zjh7uMZKwqvc0b9xfbUjHKa4Q
         hl9EhYNZZ2M2jev9dkXmbamxvACaD+y5ncx+EsNCeXtro9s/e5REztmNZdEI7H8NervH
         yGp4imh1p0AxSduFM5tECdPdy2iujWaga92TNKDMtPqVH+y4+LaaUYgPvK/5rCxMj9Nz
         4wEA==
X-Forwarded-Encrypted: i=1; AJvYcCVEIY+WMBKkklhtYPA1JzO771Vu6VIhNMVBf6DmURPX3F4VVQMeTGpBnjbWytQ5PMKeB/JLN3GoX0x3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2u8acUzZtdpBAuvgSLsOXqcPREeAALurktoLgEtDPFhR3toT
	fkvwqHuVfEuCsQkT32CCMHjo1Y4+VE+P+LRxIDxh/w/qpDuOp8PR1mx8mazBJKwxsrrJt6kG5UL
	uZY4iBStidGS084+T93AI5CopW6oMFMAQnH0edojddl0d+Vih6Tb6yt3xi0UgrdyM
X-Gm-Gg: ATEYQzwVq5EXKQlGaqip3anaxqE2jwpKfBqUIiBjetS6beXZhIXq0PClq7YgLwhFykh
	ZZMmHgdJyCagItHuPCeNejNjwdpCiDtcbWpHFU3Zb4lLBIzdaQn5H7pUrXIQikznZcQhTZyFQLy
	WKj6G7GVnJqqLSntg0wIZSIKzP1zCS2082MedvEwhdfD6ySIU+5BeektcL9GEswKA8+TEkTBti5
	4YXUKJxoTWaAgE5tgi1K7c0UZaKwimv0Xl/wo+nSqvZNrzTCHs2hj6bq++Br6gPtGXuR0djE87e
	Tm+fFvF9Zuolws6htQfWtzdq7g8UrbTxXFLvGc9sjJj5qLr/3LDDnXx8CHxJE4E/XQeEJtu/LbN
	U5xA8y+XTZBVZkC9PzZvLVINL8kUxJDtfNUfbs1KF8mzfri8Ta0l5fbE=
X-Received: by 2002:a17:903:249:b0:2b0:62dd:3a93 with SMTP id d9443c01a7336-2b269ab2df0mr43369625ad.7.1775068527214;
        Wed, 01 Apr 2026 11:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:249:b0:2b0:62dd:3a93 with SMTP id d9443c01a7336-2b269ab2df0mr43369385ad.7.1775068526727;
        Wed, 01 Apr 2026 11:35:26 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm5717965ad.42.2026.04.01.11.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:35:26 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix ICE reg size on Kodiak and SM8450 dts
Date: Thu, 02 Apr 2026 00:05:08 +0530
Message-Id: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxlzWkC/yXMQQ5AMBSE4avIW2tCGxauItJUO3gWSItIGndXL
 L9J5o8U4BmBmiySx8mB1yWhzDOyk1lGCHbJJAtZF0qVgi2027XHqAe+BJypZWWdUZCUTptHmr9
 g2/0ORz/D7m+F7vsBjm6jCHIAAAA=
X-Change-ID: 20260331-ice_dt_reg_fix-eda625cda3e2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69cd6570 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OaAkpTIj2ik3noZpo6AA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 40AsN_bGFbq-N4-ICHNkQ2u768n40cA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE3NCBTYWx0ZWRfX09TFFR18YnyM
 ny1mg3NWE3mVm4l/+cgJ7ymVmNwA43I+8CCIRwsfaHJduBtustz8Frf+uo4QNZQ/T+kapY6unLX
 cBK17kTSVMpcv8xvW2wRbdm594FX6UPhUyWJVQqxJbORcMnG7aFiWhvxzvjIf4bYZs+VoQ9J12o
 ztzFp8lO2lqqThRenA/SisP1hg0Cyfc3XpYae4ekPTYXNd18+DOAn3WdXUUtuDxbKTXaH/nmBE0
 1wLMkStCbpLua/WKz0gCk+dpQbyKTQBwtVyifzpW7Rb6AIcCjrAy/w57DVTFzTyWgIcXAQxIPJX
 rGxeuXVxwMzsxVYPJTDhVMeXX4hi+5WN25z2kkRXORXCUGZm02MLPZbDKBan33Sjl1Kgzuh1cJT
 SrLfQIhryOYoIm9rXuycpBHjx0/L+3/VQnxnD2EN2ZDDaTxLXfERgec61LUVN9/Ll+BOswwj1+b
 hlJBjc/RMpcB03V+c1Q==
X-Proofpoint-ORIG-GUID: 40AsN_bGFbq-N4-ICHNkQ2u768n40cA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010174

Update ICE reg size for kodiak and sm8450.

Ice reg size for kodiak/sm8450 is currently written incorrectly and
doesn't match hardware specification. This series attempt to fix it.

Note: I attempted to send patch series to myself but some mishap
happened but patch isn't sent to ML. Sending it again properly.
Sorry for inconvenience.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Fix ICE reg size
      arm64: dts: qcom: sm8450: Fix ICE reg size

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: d0c3bcd5b8976159d835a897254048e078f447e6
change-id: 20260331-ice_dt_reg_fix-eda625cda3e2

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

