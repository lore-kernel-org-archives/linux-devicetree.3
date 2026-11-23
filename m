Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433773;
	b=h5Izq/qs9jPJvfqp/mnXIfZ0fv7o1OYbIc+ZsYsccdwo3s5C8PTMJI6t9zWY2RLZUiUu
	 DX5yagTmCKPQbvHwdK/Wki2jSKsNAl+3tYDgMI85FOfIf6Ln35fLNoOSad97A3TOi9Yh1
	 0BeKhnQiXdIGSI9XrLpcw7Spndj0MlRbVuVTTpSkJ7E/tJvyAp1eOHNRdDUmDbgS8c570
	 uRnqn0yWb4/BlM5De0oLZUaMLEw6NrqlqFszfe8lBawGqueHH8bszFjW00qg4qLCp+l+b
	 c5VGotDfaHuFDo0KOYvyEAKveHgZOf+AXgVfVo+UAUu2RHK8ECoO5vVCcRN4FGpkbGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
	b=Jjs/ut77TqdTp//m4vOa/MyPD0nX1NXDZt/YDSxPhOtJijI+8JcRA1VU/hqWfZZqQSmc
	 hAV5TdO/JW3AnVaCaBHJbTgO+wOdIzsFl72ucNRYvJzUo7hyZyu1uMSFJPrMBrCWT4ZvG
	 2KjOGZ69wwdNH4iqxBZKpOcaoR+t1OrG68W6GY/u1y/44RqMwm+rF2nR7dvZhYq47WkGC
	 BlrcyDklAz2Fq3hp8nJtkl+yFkpQc2zAzvnzZ173oPXG4DGy4aQbnGKDsKDGx0HOy3CZC
	 DOtVQh9g59V2QYxX01QFg8FNx3rvqDWZgdafLjVdxx9OI9DsLvlyfYfeEMR+71i77IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2cTu1ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHvyILew;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B42606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2cTu1ho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHvyILew
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuSP1543949
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kvf1DqFBV/lYSc3QlXJzJu
	Xexwpm5K3ANgpze4xoM4c=; b=f2cTu1hoW8g4gc2nA2KmEj7+fu4Rcv6msPJOZj
	pWfS3GBSDt57U4QgesVu2y+y7tr/1vpP9mlzE5dMRgcDztNroAjd2TSs8gOmA3Lm
	05x5pXTTtAgW6A6fxy/dWrhJSOIUmYjq4N4N0X/NcUhzA1Hk48vbNEhPAuX8hOz2
	aBwZaWoVmfGX1+xkQrb5bXKDBqkjOYKzfcMkDochqvhM8g7JEif3WbyzyzAdp5ei
	L8r4dxJFAv6U1K6P3QhxtCOshymmjgt51clBV46KQtDgvbrBid8n6m1lwt6YDS8s
	ibAiJHeOOkGhQK0ORFSAnUcZoSLBgIA7QuOBIwTgUpxEYa5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy0173g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41b099809so2765388a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433770; x=1796038570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
        b=WHvyILewrcips1cDH7vbJ3lUf7LorMQ1n/k7wtjsBgOEa2SgQzFszKGCHZX38OoGQj
         POEKLJC9zfXQLXkuMG0B4X2NflTWFT8NTNjbdt26KXTafzG760Cwyx6zOv0MgJDgQ9/8
         5MD8iRbc04aiE/bj2U7suNuA1ooXIdnVoBwIpWO/hsDaaBq5fRlGOus1VdrG7cRhYz3e
         HxPSgEjMYP/IJhQbJmzdVrAuAXzbMYg8RtOd1wMYqi992ECyT9nG8RfPdykTyJkhuaP1
         7jhEJ2XSThDthPjW8KqWTE/2yDorwJ31rzXeDzDFdZ5fXSb9naC91oC7UxWzlhbtK0S7
         +5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433770; x=1796038570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
        b=EA/1lumcz2e3UzlAjd0xO8s6UdPXTE4crCv/YZIj10poVEiJaeNi/pZ7Oit6wIMYrQ
         Q8zp5cvwj9zu7NexqgwaWykkSpx6ExD9+nSwbZEkhyIfKi8ak7H/yPwicudfyjhFyqtO
         lHoxXU4l+WlWy8LbPW76gBJr8ZAsT2lDzMO+47i2xpNP9uSTl1SYnkFPuhCE/sgb15SH
         vBygxEqJ7CGSLl9L2TlZRR2Ig9owem7TciGewLPhYN0k1kb79PcI/Ef4Sl2DA+s8jHjr
         itaniR7aEZSEcXZN0VBlvDOLHOSitgZJQJTb/aTt81mhxVQYE+qlblrHwZYB4x2mYiLo
         Vmzg==
X-Forwarded-Encrypted: i=1; AL+hErG8ZHCBUkznOBWuCyjEmzGq+KXkeLPayha8Spyr5Zr0GQLgF2p/3NUm/NYKdFksQfCQyELPbG5C0ody@vger.kernel.org
X-Gm-Message-State: APuU4Z+z7e0RNdYFb1R9laCjr9AvEOSsYZhTzTMYRHIyd7dUb4fqqDqO
	IG42ccBc65AllNxN15AtXCcLuFkp5zAufoy/HAZd/ljfxF7S79n9O1eJ4BM3XNoLMaBYPi68Aub
	h7k8YOwb6rhxyHTZPq8wB7Ga85d5/lOFQxlDaqmgQ/XeZn/k18hbb1DtYgkBkQvBT
X-Gm-Gg: AZFdTZcYqghSldKuuGsb5goFq80RE07JfMTZIdcb+jHI5JuxqNbPK5fG1855AIHY5Um
	hwgbhTrl4QqIOTEqcQXCRZJ4gwrLmobTtQIO5QbjrVyXrVPVOPWyxOGSRGHb3Zpu6CIY9RQUTJC
	OYdkLAqgLMQZa0vKXKaJGVa9/I/mF6K9rC/GN30KJW4C51+EGBN8JQ4SAlLYxXY7vJ3RLNxlK3n
	yM9Cyl/cHmjRfRILLedpkgjBm1XGYWetvE39MfFOYckviAFO56yq2jHki7xRJNmDU5sEZYtftpr
	4R9OaVIO38mpINMfzz0eukqjOfdt0QqMdpaTYyTm0Ve7A6pWZDGqL3lmxQlqL7eYWU7soSHlzGm
	ioolPMdApOcoXrkCLf36pnQaOjsq0C+EDpdPqEoTVTTo4ymdCdeVJfWeFrbNT08sEe4dCwRbguz
	b3yzgG
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr10129785a91.25.1795433770179;
        Mon, 23 Nov 2026 03:36:10 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr10129770a91.25.1795433769726;
        Mon, 23 Nov 2026 03:36:09 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:09 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Mon, 23 Nov 2026 17:05:58 +0530
Message-Id: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB4lBGsC/3XOTWrDMBAF4KsYraug0W+UVe9RSpGmo0QQx41km
 4bgu1dxNiGkm4E3MN+8K6tUMlW2666s0JxrHk4t6LeO4SGc9sTzd8tMCmkBhOT746WfyheGvlY
 OmLYq6aC1S6yd/BRK+XflPj7vudB5aup4X7IYKnEc+j6Pu84LT8kFH5RIAZQn68kYQ8oKa7ciG
 cTgnLTsZh1yHYdyWZvOsGKvS83ABU8YLfiEToF/H2rdnKdwvP3dtLF6s3wwQD0ZshkRorNGeHR
 a/2OoR8M/GaoZDkL01qIGfNVjWZY/9npnJIMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=1935;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=8yFIvWAABarJ0JyJs13EEogwta+ICFjTnQS8FxrfjGY=;
 b=0whS6kx5agoifZd4Hi3g5c1l2aKyklENAVvviS1Ua/4nBS+idtPpWP+TpLYe7U5bN9PeDuASC
 pzfCoAjkGS0DB8GqvdYjBCbJy38VfUNfDGEQUDk9YkXnErqt2ZZq2D+
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfXxpyarxg/E84/
 c1r/KKLip6LtExWoP8dX88VzxgjsTxX15ca+QqarVvAu+0AEsHKPhuj8LwP6oALvTjXS60CtMTj
 uEH/RxoTSWNVr5HmkFTiQn/jjzQau6Kc4Lu2MQaQWyoZ3kVit+WIrBYCfMjTZf8BBt3xRgPAmg0
 dSIHE3CrePeSMdjQbyoLi9L82tIVh/yVHViZUjpbDLwGxH2aIl4/5tKL0PEjsgL3UNmAWee9zxr
 GAwaayhuwp5hb6Ed1OShSnTt1U+0eEI+40/TGD8SP/P0/LlFuFC8b0oXanL2wWDjM56oFAURhSr
 hk0C9CT2OM4hitxEfe6iDA37EjgQhr0ocBI/VPiOPAM6eHg4vZuINkoHeIv2SeA/3CN7oIRTIML
 OfeiOUM3yzklsGGKeXqRJQZdKOdBHzKVnWEBZ1QuDYwqewytuCF8ZJMnxxMr8cOROfNGOzeVzZ9
 GgvJKRWdSlI1fMO2jOg==
X-Proofpoint-ORIG-GUID: lCcck6UWX_rf32io7gjiJW5YcQVv_sgO
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04252b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: lCcck6UWX_rf32io7gjiJW5YcQVv_sgO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX8o37wY97v+FW
 Ot1cjf+pFklBlVTrZFttQgJdwxzUpD7ISy+UnL19LkEMYlhZhm5jyvYHIPYv+U300OkghkZdKNi
 cMOo00Gt+zm3NpAilCC+cvXyoKWEsLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230046

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

This fixes the Glymur CAMSS binding added for v7.4-rc before the old
port@3 ABI appears in a final release.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v4:
- Rebase on next-20261120
- Add Fixes tags and clarify that this targets the current v7.4-rc cycle - Krzysztof, Bryan
- Rework commit logs to describe the ABI fix and Glymur CSIPHY resources 
- Link to v3: https://lore.kernel.org/r/20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com

Changes in v3:
- Clarify the binding ABI change and why the old port@3 ABI worked - Krzysztof
- Explain in commit dropping port@3 does not affect in-tree users because
  Glymur DTS support is still under review - Loic
- Link to v2: https://lore.kernel.org/r/20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com

Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use linear CSI ports
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

