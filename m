Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609465;
	b=enCdxADli9ZvK2ItUeIgjy+Bo/OpYnAk3yPKGv/q/X4F0mNJrbwEkk6LmIrMxt6dgOKA
	 7b3/1HRbg5TnuANbk+58aH9hsyjIA4JF3vqsf7ODA7/GkeI/B/YWdyLLN8UG+mEXSYBFX
	 gp2uzqwT6h79VyXE+qZkQEvTXgWHqDAu2eVSYqyghP7ipL7dmnkVoCxrS1kB+jbYImSCA
	 l74jv1zt3hJVTseTDc2qSuBsoUrYyIdglFZSSk8ZAzEPQpoYaOdHQx6lgVqv4CMH02ngn
	 W2aobi6gVIGfLjUU5ts2MOVR9lD7OiISesqXZTMidsm3sjZxY/UdF/ZymoFnWbbVPrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609465;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
	b=vcOp7CG76lriGo/rtv+5iII0Dva56mcTsaqLlaIuypwxNJqUuyVC+OcSblMVNDHeOr6F
	 B/4dSZecgSrks0UsvREhmdNIV50kgrt0zZV5P8ctvyKM0kG6PAFgVd/b2vSbSNELQH6s2
	 H0yx/dWTyvzUhR8WKqIW5YJgXqFcjBV7LNeM5ETW3zszxKmCdrR/fMNhFXw+5qPtxS6Vw
	 Hs0X1Gntn2i6Ruu3pUrmTvJdrFqOkimwrep4w4dnMHwonECwtlfIobzO/068I+v/3BZWw
	 0Goe20kd/gP5UY39naitYMonVqr693EN3Y4Ld0zzeywEj6ufhoRU7V77uSdzxpGG0EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HErbqs6n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GhH8AmI9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40A606A33D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B40A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HErbqs6n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GhH8AmI9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25W3YR3924346
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 08:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fK+MfzAdps/6x1wKXxC8U0
	J9pUwDKyZlecelLkcuWlc=; b=HErbqs6nU0hxqI0mA5JoSmE2p2PdO5+fJE6mrk
	hUM1PKN7wtYBKCvAXR9jD3ug4TKzTnvej8g+ywslTskCnDNZoV4o3kjOGBOZQj+y
	hp5rJMRmagM0hJluEanpWp8pE3meW/vXDJLgz9DtCIPrMLd7Rxl/4kocgru3SKp/
	o9ygQfhsye47QbzfVxHRG/Wq+zSRbrweBqzyFbmLOdBInR64vZI5H0ksJ9bca1Tj
	xQXU3hanAnzlllOCMAe6pZGzBp5kcTklyupX4FJHWy7VRKbYoT7/BWWQRwd/pUlu
	InyFqk5x5KALJfcitd6HovTRBkkFyIP/u1S0c4PNmRTSGdHA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rq9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:51:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a08903566dso2733124b3a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609464; x=1794214264; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
        b=GhH8AmI9AjePY7U/JEzX9AlIjIjCh3/NPJwgTopPwA2XmWVtTQ28zUBwY4nJ5Xjcg6
         8x91bmDErfd9Qfry5M7beHecfwwfPWs2hdjlDdhHlFz2eWl2Y1eBsFtP/GtQrPFwqjdG
         9U/rJz/Gk1BUhE1/tbNW3be3Wqg+tTtrg7DrABAkgJl0L0RpchX7L37/hpTAPS2pS12Z
         XbnSTZ/9EUCqHrlrm7wHiDIbaRvWiVi2ujmeLNZ5JDxnSdP/YoqHp5co15q90NELZjRH
         HEMtZgUlvrRmE0vvYAjm+0Q7S8JYCkIHUSHQdanPInrlLcZk0PJU1U24/A7sN6cEEUWe
         yPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609464; x=1794214264;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fK+MfzAdps/6x1wKXxC8U0J9pUwDKyZlecelLkcuWlc=;
        b=16LzaRo5iVQjfnl1qPNUpGqKlxEA1dEvebHxdg51QT8rPLsI5lUQhJLSYhlL9J4B3R
         ojE7ac5RphToN+v76J9/QqjYc08lIH1wZiUpRpmBwXcmepYlzaN2ce1x3vx7vwYXUpOc
         gaZR/Zvq4vXf0UyrvMDCUTRPeSQNZpiWPsY3UtkyjPC4xI+EMFpc5ZqnVdZRjUvG8B0v
         giqeyXIyBY9HkssOCU1753wJL913CeJKGDAOPCWW2eVmBj/PMjsVKWQgiQgy+MPJHESK
         Eny8KQl6ewocC1GVQf08hAg/W2kd0KQ5k1ZpqBzvUtdOtzZrYmiqj9dJemjuFycFe+1B
         w84Q==
X-Forwarded-Encrypted: i=1; AKwUvBxINnlQm5QY1pKDzVUD5NcaS7cTvstY8jXwrBhh32LBUdNdnAUzv+z+5solj5Ug4e4A/z+D1xkfqkas@vger.kernel.org
X-Gm-Message-State: APuU4Z9q5qQPjXWZlmatqK5pSZvo0MpUazHad2pUMfMVvr4y9oqS/LxA
	6CRXUTzplzH5ejtgLBaagx3mL0pbyxn7/vOtpwTb+9phET3QZuASMCtVk+4eFs3iTuQt1TymraH
	tOdhfZDb6TJISGKDDF11BqiCcSZKMcXgnKQ9aSp1iNlTJhFqICCJNAR7KeGugWIH1OsNRBHl6
X-Gm-Gg: AYBFou2P6iYtquTqm1dRmqkkabFX98IUiAUUzGlkui9SUjM8ikY6L5IM0L6gTrfEYxy
	hm/CJXvSzyIVUjApkc1GtcKilWHyr+6vdVj0VDYlorQE0EQ6iKmanMsnNwEm3U8FTB/mtpkx82k
	VGRRtBSjbvVf2HsIFPXxU0+hxMvze0e7qRSU2Kn54ao6uRlospaR39jyjkrpIa8TNPFG6KqgTNd
	3dIRQuplbO7t5pnLPOw5ioCe4xHR165wlRhQQMfo2caXyRogysq6gyHtgCqc+jB1KtPlOujen2o
	QDSLmX94WtIX+yDepF8sPtmDX/nZcYToiyoKZYcX/C8w1Yj9YXMlZToC3lwNlFM2/crm9XJHyR+
	8wxi4Yhd6qfZMG1KIjX8z9vUhXFzecxmflxK86n0HKBmTotyo/E3FvRTdyUt0GSVtMAWZdJQ9oa
	8xHSU=
X-Received: by 2002:a05:6a00:2407:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a83366b9f4mr7480390b3a.51.1793609464004;
        Mon, 02 Nov 2026 00:51:04 -0800 (PST)
X-Received: by 2002:a05:6a00:2407:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a83366b9f4mr7480379b3a.51.1793609463545;
        Mon, 02 Nov 2026 00:51:03 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm1748329b3a.9.2026.11.02.00.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:51:03 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: camss: Use Glymur graph ports as CSIPHY
 IDs
Date: Mon, 02 Nov 2026 14:20:56 +0530
Message-Id: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPBO6GoC/yXMUQqDMBBF0a2E+W7AxGCqWylSYjqxA422M1pax
 L031M/z4N0NBJlQoFMbML5JaJ4KzElBvIdpRE23YrCVbYyprB4f37zyNYYsok1M5zq54JxPUC5
 PxkSff+7SH2Z8raW6HCMMQVDHOWdaOuUb1w7B16lFD/2+/wCjGpphjgAAAA==
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793609458; l=1407;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=NKMs1snAVmrZ2J6U8AwvfHr/ySDqtJanq5jMU2OoPeo=;
 b=G1+y9A9bMG/HwEd6iMnE8y27+Bl8LpKfJQZgoV7mHRUdnPhGSe+ywah3seqSXTrHNp+pISGAi
 oVKCgIbPphsAHXKlE7wtXedzDB79T2QtqoNEfQD1E9NJPI349Mw7p2Z
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: xI703RyJORL8NknYm1d8VbkrG72i-cjY
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae84ef8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IAV7YMJS40DXAaybdl4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX5ou3qKVIYnPG
 fylHuWbxXkMlce95tGxM38vczmzX00uQowFtOLdWBFgTb9rN3XaXIqaXc35tv0jb9CKSBZZwe6j
 zH71NmKR6F0rMDfIUs7i9exB027olI7iKJBbLoCO736j6cRxt6lQ52DetmiTtzHTsZIa4JNZF/5
 IZrNjqiq9Fc9X5vuIGQNBL5dIR43NmR5FiyOKufUnLFDOOoxkWyKURVhSV5kx9PtnvAaO6qUx1l
 rOzmirwUzkJX2CdJtoPz+YSPPz75zB2ximSMin0CLAtpuLr7HyZjYH7tCZRCImdFGuW09bWAQwB
 bspUHkQ3M6OsIm1mFpv384AZR+VMGpPdEb1FL+nrFxjV3EcrAAlfQklvAdA3T2CznsJtB/Bjrkx
 zJ+v2WqhQypF6XKyvAC5ivdK3W5zExtNOIR47ZVNxt6U0L8j7j5r3VG8s4KmBeJTdQgJrVRfz9l
 KQm4GGgcC1ME9pVWQtw==
X-Proofpoint-GUID: xI703RyJORL8NknYm1d8VbkrG72i-cjY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX9fjLp/qLYXwZ
 550IhG+qsPEjbnzteypegvdSBGDy8GHR2LGZ6DYfVeC5rF15wl1IC7zLRAoy1b6qCRE30FxA589
 fdaRAwZxe/Mg2EOFS3LmITmL3455ry0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

This follows up on the discussion around Glymur using standalone CSI2 PHY
nodes instead of the CAMSS CSIPHY resource table.

Glymur currently reuses the X1E80100 CAMSS resources. That works for
CSIPHY4 only because the X1E80100 resource table maps resource entry 3 to
CSIPHY id 4. After dropping the X1E80100 CSIPHY resource table, the
standalone PHY path uses the graph port number as the CSIPHY id, so
CSIPHY4 must be described as port@4.

Update the Glymur binding to allow ports 0, 1 and 4, then add
Glymur-specific CAMSS resources without reusing the X1E80100 CSIPHY
resource table.

Discussion:
https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/

Depends-on: https://lore.kernel.org/all/20261026224957.1115370-1-vz@kernel.org/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use CSIPHY indices for ports
      media: qcom: camss: Add Glymur specific resources

 .../devicetree/bindings/media/qcom,glymur-camss.yaml    |  6 +++---
 drivers/media/platform/qcom/camss/camss.c               | 17 ++++++++++++++++-
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

