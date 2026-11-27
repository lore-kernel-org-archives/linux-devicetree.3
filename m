Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769402;
	b=vVy5X/yjzt7ZCeFHCf7P5Xmn1TA4eOFHNZf865pls7tPx3PYBPnWeIu7lCEp8EU1VImD
	 sx1fQF/7el+NC9MrFBdqMif7w41mTK3sydRIYiMDt0uX3PO6Y+wgvvHA+wb/YO5sIMcU2
	 oXI+2VffD4rDq/JLe39v9cUiNXznptCFHqgUdB0EXfM/QOxEwkkpczjLftbKs/BACfGDy
	 M4l2lyUNTYQ4So5h+IszEEnc++NJY9ETtybTcjMiITtLm3LSoRxm5gjXYy7mBxhlNGaN1
	 i4aikMUhaJg6/kA80PhHCrPu8HnL61P8usOKVemrupK4jq8n3fXNr2zLFzMbZucVCkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769402;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
	b=3umQw50MNOXBd7GOGUfHC1Uah54V6poCZK2b4Ha6BmWzx47yA2itox+xKiHUz/JqWSS+
	 rF57pluhyL36JGC+3XpU5GjsSx9FJyfGMudzLSuvQDp5ZIS7K8QM7oDCYTIFRBa0kjkR/
	 ovN8hng1OkfiI+8HKhdAOwe/D7QMiTzkl8UosinmEmfM5SgAAHpMXKX6YhV9bjGdLrSro
	 paLaqvFyGTVp/w7k8KssrhCPwc73/c/NJ3uFqBortLuaqybnBb/a9AZ13NzgYXghP1RBL
	 EGjeW66iml811Xfno3XXRBrIpaCvM+JrqJOqz+SlHoVwfuu34R2+yhB7CD2a32u4ncA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dFRCaNK/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2141606A33C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2141606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFRCaNK/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GVTJ1780018
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=; b=dFRCaNK/4p7+RnyJ
	Y47wepn4POLlkF1UD1qcJga1XDFTk3yAIKtxnEE6BeqraJQOBrLNcIhfid0FyyNV
	r1/7K2DFVuLPxgqhTF1xp9lhmk9CIrmhforMtEgGaVz8yaejnQMdNoEZm7q5ksAB
	n4vCwAJtOgBp0X1kb1OQmO9xmThCEQpKaGXo0vN4xEQDrtCENvGhs7i4eLcNQbof
	lx34LDhTSVahbEKxcDpsDIT7gAuUqlaawndHezehJPEUzUqyfUolDh57t3+DuMqG
	CtNH/JbvJNzKXu1ov2ltLVmrkqPrKzZUbu7gS346l+yt/TaIeUIpX0iOsn1YPTL6
	eFzaQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgr3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:50:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd750de6e8eso284325a12.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769399; x=1796374199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=W0hJj+vRfLgp8eSspb/yvppLVigfhZfo+1TuSpCEwQ4SeGldcBYS3crDVR/tEfFRrp
         n1m0ZurXcicu6EG/kKysE2k3K8RIRF1jITHqIszAVEzS9xqRte36Lr3TFtukk0ChMuhI
         Atn2vzVMvrOt+9jSSnJEU7Q7T3TMd5qZI5lDftDYdYSOFZGIteP2MXHN3pc8Ow8FuWXq
         3h5zq3tTuHTjzlS42o731yeg6wuGTfA16J3m7g+nJi23fkyCkD/d+D+/IqDYT5dxYCIw
         DhxUMTcRM9CCUZ2d5kXNBw3SAOy5WeyyTxJXibAUuO5DAvNGQV4lrYEWp0Uaw/Xl4hGy
         6jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769399; x=1796374199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=wq7TmDRhRFjzqtJ7hqeBAJeNLIEZZmpeE4VZM7wO3CtMFqqMAQ/7LmYqBTASbOlxKU
         k0h5T/rQQF5dyG5/DUPhWwXx3FUQVcMyubT4QhW1pJsLDDTDJFahJTyXmkHmsNkC9Toj
         YqlXrYhjHuxP3EXbPgKozg0YNRpb83ekqcxyu0BF43rOly72Rx1pUyLSTD+uo5HWUYCm
         /OcpwNiLRXOyfpISREuL2+1ZgkK37n8d/TQlKhfchm3OvFlWwYpdoBBWhSRWcje32bXV
         ODQkD0zL3//nA36Y31eYAz0d/KCRXEAL5oxjDeai8/1wcoJ+K+ctXCnX5xedxnUckjX4
         qw/A==
X-Forwarded-Encrypted: i=1; AL+hErFIGCHLtB7JCGY16OhAKcjkHZGA+kBBGUIFrA2OctvW5OOxLXwNHGQucVx9gNavFwNfvlBQwsqeDzuO@vger.kernel.org
X-Gm-Message-State: APuU4Z/jEhc9xocSL1PTy0Fa2YfB0NbHV+0cFEW6wclUxvwWG8kkUQ9D
	K2UJJjvng2o8YNa9sCj0J6KJMs36ZVCGFCWNqFe+3bK7ue9zhLmWNrvEJM5ftRMUy36lbUNsyyC
	v+RFfLCVXLgFyH4/Xn1Bv/4bniN1LresD0gLuneUfxVovPShUg9VhoaNi9dZKN6iI
X-Gm-Gg: AZFdTZcPFZgd3Hsace6mtzdSvsiXaYcOf9v19DrV8VEhtS3UCz0ZWh2zwigG7xfYwxh
	oa5+vsG5F/O1N4Fw2hm60kgcVOX5FRFFEaWhudjz9r60mnheVNNxNX0S5NnBRPQ33S7863rdnV4
	+5IJeM3eQM7m7SFKmbEM7+QZewhkF+eptZ5Vfmfr9vShqHBaIaHncn90zuiHa6mVc3YoICsiXoA
	SrXIbTlvBd8QZvH5c16wfwnNzIuWcpz3RMOhebKNGdD4/L4wUONrBhW6ojoR/KMBPV9hskoG9II
	r/LSm3PF6msbYISg8C2dLKUJzyIkuNrAWJ7QlV2gvGqjezkNQ7xvMOaC/S3KRNIQFiqvhCqiibd
	CwjLTbxsTHyenvY90c8xmwEH1g/9+hs1mj9CjRasRpkYZzLQ2isdO9cQ8reX8tV6TgxPQUCyvNg
	1VXFnJ7r/4pnkP0+U/kZbTcqG+v3dazCgPMjNMAcBfv9+CShT0T65XhcYITuRlfqM81DgDAUrfk
	0kBqIqckgRTP9WidkNIQtP9+Ko9oA==
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294635ad.3.1795769399456;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294345ad.3.1795769399034;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:58 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:26 +0530
Subject: [PATCH 4/7] leds: qcom-lpg: Add PM7550 PWM compatible
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
Message-Id: <20261127-eliza_disp_all-v1-4-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=1089;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=tkx+9mrW5AZ+HOy6XzHglysRWK78jQma1MhEIAFTTJo=;
 b=8s59DlyRSZewARMpmXDeN0BjCap++JIQsz8Fj8QZAwu5z52tfIwwDwzARFsRver9MLXktwHAL
 GkoYA3WNzQmBx2LBkykLEnVO14r488O89BTrGA8krDwxPGxcenNWjyk
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/mQ26qZa4YbY
 h56LgFOpcUe3eQp9UdkKzlPnCt/FDGbGn8pP/1jgiCpgfwabC+s4AssLm57KsNJRCQMvwBpfpPA
 KoyKtJLuh+isaaDNB5nSFFI4VzGMbHo=
X-Proofpoint-ORIG-GUID: uNHp9TVFfO0Sna3Wr4gTCN-sSDUy2Ubi
X-Proofpoint-GUID: uNHp9TVFfO0Sna3Wr4gTCN-sSDUy2Ubi
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b094439 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8FmHkYH7MGniFFCvUCUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX1kPjsk8dLOMx
 VS1xJlCA4pQsc36OhvGAGugg4U4sR4AhX38ugnNb+EXHRF9WJuaz3ZDu7Cde18qIvAkOsLrNDZy
 6HoTZ5IO4cyeDqCQ4wg5ZBpvIw/rmRig1Yxn0JT1hwn8IYqieSPgJE+1TKfwV7d/5FXF4CQn8gt
 TNSIauNUKEU7zvvpmYlcjPwXYbYAIFj/j7SbIwnm0ixvTP+BAuTYziZr6TXVd8rVEj91NyhUSl6
 /baS0di54dvv7ZWrejwLUYYAlNKgVMe98I/4LkB2akW4CKgxCE2u1ytj52Hm+A16gZusPqVIsy1
 NXwiKcTfbmqy9+r0rTro794GEwFNEj6KuRkzBMAfO4ScCZg4Ej1FKP43XrA/5PdlCErEduIREF7
 cw88KokClQvrfqHSQ1PTQDRjvN5e6x0GZpRMeepSpu3dZbW1dj5y9TxXnvHDzCnCBMlRdy2e+4P
 Qryod0H1F4HWnWR1CXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

PM7550 provides an LPG block compatible with the PM8350C PWM programming
model.

Add the PM7550 PWM compatible to the LPG OF match table and reuse the
existing PM8350C PWM data.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 98e39e03b9a1..6c9cbc75bbfb 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1827,6 +1827,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
 	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
 	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
+	{ .compatible = "qcom,pm7550-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
 	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },

-- 
2.34.1

