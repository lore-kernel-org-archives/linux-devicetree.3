Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82C480331
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027157; cv=none; b=VvWJlQFrZSuOMpuj1HY4tJZMu62HIAqMD/EINtL0KW8b8YjRiS8Li/v/Yxb9UHI4t3Ph/lR2L5toaMeiCMUL+wvoP7V/d5PW4qQM6h1hoAhM1kqiWFkQ28LkOiFRw1N6pWeUbGZOnIymvYWa4H/19VjIX9VoepidsQiJNMuQYU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027157; c=relaxed/simple;
	bh=8FCfjPBXOgeSOCE9oMNfyVBDBWfxZtU2M5HiiMnr1BI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjLkQMypKoTB9hqGXOYiRZwGz7zCAkTXFpNCErDY3WSCJ0O6+FRyVEgqZrxDa4zaJlsZ7XZrFzNj5miBFGVTarNm780AkDlBm44TabtVsFWsh/PxuPahM1VsHnypeItCiT8GMz7y4TYj8bgsqdlCwCIHC1PjD6BFMeLMcFsucw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiS/BjLC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxpK1nvC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiS/BjLC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxpK1nvC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ncnY1227535
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 14:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=; b=QiS/BjLC/B/ZEeVX
	leRVFOHaAJqMLNNOkf2Jz8C6MGNXVKN5Vf/0NWYe41lq8NiS1jJPAV3YsY3ZOUNs
	828C4l6IgPKiuUH9sVJXPZUZ085ZneGDG+p2OKNlHwsdG+fW41bKbCeQLr8hHJc3
	lKivAWR5nCfpgOhkRRH8A155NsVkGDA/oChU9txG0xMG/y0xq5MBWRurXXoTRIEF
	kyXUAFfO20Y98sbh8K3eRAvfb9xHes6C/yLXmWyqSRdhSJjVT6ki5NH3cBDLNPAl
	1w42y4alJ7hBsZ6gbmV5NPkMqY0IRRSxlgO9CsWyiGJa9+7r5nAehiEXA6VjAla5
	noHa+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqduhhe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 14:39:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so17979581cf.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027151; x=1786631951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=KxpK1nvC3udKWFMjX710IHO95Mh9MzDbIabdjk6y0Q2dCuhRR7hfOuhRVLcHlEccTS
         BkrCXMlwjAU25hvgcXXHGX5BuTT5fGSewTdRnefx18uZPHUJY//Yp2KihXKV2E0c3Iwt
         nf8JRNW80jlgp7KO+wfGjjwKu8JvFV4K+5rZdsY3Qka87QPbDM1iwgb5D9AjHBt5wv+T
         ztENrCn2BHzrnS8aWj5Iz7U25u5PYRhV2MpAB51UNe4x3Rq52dLRqIvAXW7n/X84bqdd
         1FOH4BIKLbTknbqJl25Z3DKLvuIIy4MssuKX7OXvDI0SiOXrpr4CnME7uoUukUEd6AW4
         WtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027151; x=1786631951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=ExX2w+garCDimQNwSgk3qnXff1YYUoOo5Ch4UP6912rLn5WaFECs78wr63XMWI9Egt
         fHBwm7R11xnaR5a8fA/xciWHWSnwD8kR4m8r8Qb5sng02wFOIa6bdfkOzy6SFdZVPBiH
         CQw9jsJ6ShRKHNtYtqi8UluB2W3mRlJWa2qdrIFQJCEzZaSxuQ4geaofC1hSEdMFvHin
         bQ2Ol/isToBop2FIu3nNF5mlbTbFv0QJcLAxLBh/oPHVqpGn/tcM+HrJqOhpbPdbGMsZ
         Y+S0T28xh89YNv7So2L95344AGpGU/1Vk5gFLsNk9Xa/8qWifYA3FZQVrXNiBGkT2or7
         fv+A==
X-Forwarded-Encrypted: i=1; AHgh+RpKi25NyVQ402tGcV1bJqBNpnhZQDOoaquY7liTbzyKx7OGCpiQK6pdJ3E55qcfXHQomw5D/FihidF/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5aXRIY9WUuSE2HjDD3aWNCJBiurAcf5pWs3btkJSQfcgsbZCe
	aRosZFJA/gk+Isw7LhpNbM+BUW6JFOj21vnkho6LMbHa8ELRoyp02Di8IbycOruWCF8rgtqCpEx
	b7HCQoy6RPg4BzbasBqM8WPk9NjxVE4x9N+pS60vRlQwZnJ6hOPZGQ7RVxF/D3dWb
X-Gm-Gg: AR+sD11ffkFiyRde09OA/gVXKJbY9CckrtcBmHjNNX74u7XZrnvbKc7bwYsXwp1Jxsq
	Drnmdo44koqJ/yi1t0lkW448iqfqpCQbI7F1f1WFaUU6y7UZfiW+FN7b5+V2tUWGnRT3kn+0ZpS
	wovSG10upxr3c1UUDkLM7P8gEZJnBKYqYCXuaZk/dLKDhRexpKjJyChtwtD7tC9fCLEhbvCy/sr
	9mD5fteAQ88717Zp+2zcNeKHPw4fRCWWjjfAVNHA5FKyK8hZWxFk4ZavJmMrkHaiagfFXae4H3X
	vqGPPtGjIPLpmrjpugijY/cZrLDKq72wWhvu0ffLFIR1x3lq5WoSvm5FrsraO9Fy4KY4vxX4c29
	K7H9tAoxr2zX7OtawggATLShtTi7ppbE534n4udEnjBnZQZLn/ucWJeFObooyM5tWiuLkZiPkAF
	xr4rk3/bg81XcaxoRrPJVUzx/aI8n0NuybgofLnwyLpRHkbOoSMA==
X-Received: by 2002:a05:622a:998:b0:51f:20e1:137f with SMTP id d75a77b69052e-52ce6035ce7mr175976591cf.19.1786027151284;
        Thu, 06 Aug 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:51f:20e1:137f with SMTP id d75a77b69052e-52ce6035ce7mr175975181cf.19.1786027150660;
        Thu, 06 Aug 2026 07:39:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:39:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:42 +0200
Subject: [PATCH v10 09/10] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-9-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: PuyFwnLwYB1-sIGaC6tj5Exd-Y1VTAib
X-Proofpoint-ORIG-GUID: PuyFwnLwYB1-sIGaC6tj5Exd-Y1VTAib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXxoOA00wqhbvb
 GYmA0HIplF6hebMmIhPB3Q1KK2zcheJwDVQKtWG8000ql+CBAB1zZt+Bh1udoNMO/hk+1BsRnc2
 RUndmbeguZ4ms+52qsQz2v+vOEPxolU1kpxf0KShHc+/33m8KEyl/flnxSwj8yxtgBtCILkBZe1
 qBvoS/Bze+KhbCYX963oZc+v8HizedXdDO1cu562i57ClmTklixEuT9newOlofSiQt8DGc9PlvX
 1BcI1FkOyfXQ6GF5ZzzQuRO/M/ysE4wKJRW7WKVdhoQddv4+ct/690DyQnkK+tDhuQHhKuTdg9I
 RNg5WAV+0N6gZv+lNxnWid5yKDAcwoeqqjQTUh7QrhAjOdkBm9YonaljFQysLUPz5XNDLr0Xowb
 0dwL5/PD63i8poeSmcgSDn4BUsvw59lYJEgCRHQbfpME8bOrCpoPzj8K0mOB8s8m4MDjjKbE7Fl
 S8V0unJPq8evA+eDPig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX8O3o2bbj+fq7
 Qwa0xmlw6/fOfoAgt+W94RPSV66uhjmK7pWQi+GhauJSELsgf1w6uLFiednN5vUH4AqwbPIeLSs
 Nme1AKgslRtbE/pjN+B+cq2xexpjv+Q=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a749c91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060114

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 04ebe290bc784ea854ec7743bc753c3e41f556d3..06cb787b0559f3d712ec2b88d9e25a7d46fb00b3 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -723,8 +723,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1

