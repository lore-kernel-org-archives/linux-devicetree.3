Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2F44E648
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427269; cv=none; b=tlTBQUmOKZqQcg46FS5y/4wHBuqEDH8QBlMCNmjoHfa9NcrUD3xyW/HlLoyNmS7IkiOiHtqdLcN/Xy+lWdSMn2H3Uh6z9XYaaZXV5yIKki15n/BKSb08L43BP0TngIr8tVZp5qJoh66drT82djO/gAG/t97hzcnvRZiE5GG/tVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427269; c=relaxed/simple;
	bh=8FCfjPBXOgeSOCE9oMNfyVBDBWfxZtU2M5HiiMnr1BI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kp40zrLAgKLBDpRRPU4ymGQ0WA5S5WCoBCvry4Tbu7qAAEX5UAx1SzTDSHgkeVL+N5XPKK3qQ5Qsj1W0pzIjBsxJF0QuCCaU4X/aclWsPFHGb6bbiK46WRRaHXDy4VuCnwyIgkzlVI/vp6+t3FhvLNB/cp2SYoTvAG1Fr+NAEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoQ+dBJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P003CaGp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoQ+dBJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P003CaGp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQp3j1144998
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=; b=CoQ+dBJ2w2OXWcV7
	89Yvmm28+CeLZyllRsKsEYx2lctJzjxebUPTXvnncMJYuuM8mG5FftOXEjE7Pbub
	i+c84ERsedV8jQDpkqL/kyr+aqqvCUcojbG6t4DKyuqLvEHA66yXRnE4TVQy22hC
	REpHvQ0DdAwnpUAwQdeUZU7fkLkcTHMeAy/Z10PpKMBKAamGTX9MaUwnXdH3/IBG
	MDiA7KkJal0svawJPgwTk88UazLOKDygNC0qYWI+dM9DoVjYo4aQaq6ZRdj7B3Qj
	8xdnU8MqzLJLaQiVSlkOSrRbL5SFX1RIrOoJFBUS1yoDaOd2WB0Px17lCZUOAVhY
	iGhUqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k60f6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:01:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73858d44c8aso3135137.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427266; x=1786032066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=P003CaGp5yIvn8rIeobam26+rQXuygPLa3OrwhNG5B36x4Y3PbsMD3xTATAXqqpq84
         Y/GBuMp9mY/ExTlrPHaBox8FO2CWH9HHBZEZajA8P4dep+eNfhrVUQ6di5frHyWjHkXG
         49IXFmitsivjYcYDUZrSo7j5vdY1V2VkmBW0OlV/7MWNw2+M7mj4NG2rhngg9YeihY1m
         B4vbvvpjr3xwXb8ehtxFHGdrTyWPm1+Nqzwvn5FQrZHqEP0uo680Fs4ldhwzhtLrt0jV
         egK+zppz+y3phq6YlnxWoofnhPqiIv/R29YMjYluAST/65tFh9gR93Zb6Ne+ThuILZI5
         /nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427266; x=1786032066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=gOp6OIc3UMEsAmcAhCivciBV4GTbrlQ19f3JW6AVQMfayXQKGHVd1paGmd1NykMuGu
         xB0VAixaYps74lkszdObUUB9MALiFx0wguFa+km68MPwE1tu+buFJIjy5euMmqn88Wxo
         ZfH0bQapUkq28v12oSkGVNFi/kBdtvGPdSJTfbhX+l225KT/dLqQEjD7enW5a3qqTkAY
         BNYgmNDpNZjVKhXECP/KQTSd4U1/XXcHr/GFC7+ULjn3h6qE+L/p/7wgo/f4tugn+mLk
         EV5uVtxrT0w4y/WbUu6b/wEbxAoqszle4pwLkluDZ2SxeQAS9UlwCZ6VgXiz6niZZqPy
         ZAsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqav0q/jpnG01T+53ETfRdFPuUPMad5VhIC493mu20KthaBoL6aJs3Vf/bGW0t39VhwCRhHVbJEeAiw@vger.kernel.org
X-Gm-Message-State: AOJu0YztG0eyUtV96cubmQf8r5vny5owNXhWSP/h/ese938ayYthyVf5
	CyQTrXtTyqJIF3se+kUim7zH4MlUeqM1IGNHVWdmiKVuAYFboIka7Pq25TCnvQoz2EO9784UQs9
	SzyD+yMgxZdFQXUXcu5jPhNl/9ohXe4X00Ua0QFphwvrvfWPYtuQGUCyOK7/WA/J+
X-Gm-Gg: AR+sD10QHonXykH1H9YtmybAaRMppgUbzDa1cHnvqwhEH1U/cLr/FHZImDv5haSWK6z
	fBvFyLviYo0o7PwHSryXhvRITM6I9CbgnJrCIniIKSYWFJUV/h5uw079J5y5t2sDVFamrZbhwG/
	hEPj7L6gW4NN7jN7Gm1CX6buz66grrNMO1tcOnG6yMlLmpiZb3jtc2aqQ51WNN9crrniU4LgcLB
	a1NpkTLvtqBLqkBSumwHm2r0ncz5i9fEcV335QOZvl21sDsKEtDFbg1HIxM/baKezOxDw/daFed
	Tpuh7ANkz7GVO475ujf/gXAAY1yvN5fF/OFKSjZhg4+C+6Op9X52lviJJkFyJI29br3r+jqUAZF
	znvwGHb/zvqJIOjNTVPrBMjFi3HKkUd2BOaGX+LFP0nCqu6EjkLoegV0LL6BvTM6YlD4jDZuDgo
	MLw9oPfaVnwxESeWRa8FdZWo4OdqQ9Y9+eqemiSfW6g2/ywEr+hmcv
X-Received: by 2002:a05:6102:1484:b0:74a:b5e3:e96f with SMTP id ada2fe7eead31-7574dfce200mr1067378137.7.1785427264707;
        Thu, 30 Jul 2026 09:01:04 -0700 (PDT)
X-Received: by 2002:a05:6102:1484:b0:74a:b5e3:e96f with SMTP id ada2fe7eead31-7574dfce200mr1067275137.7.1785427263969;
        Thu, 30 Jul 2026 09:01:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:03 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:39 +0200
Subject: [PATCH v9 09/10] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-9-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
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
X-Proofpoint-GUID: -ysVoVR6x_Sa9u-RbFFs3hKCPjMktR3l
X-Proofpoint-ORIG-GUID: -ysVoVR6x_Sa9u-RbFFs3hKCPjMktR3l
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b7542 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX/jCf8p9Q9pz3
 iRmNyK2QojYPcgiQkNP1/f4GRitopJgqmmG9bY7qOsf9zuq4+wQ8PUjvRK4HEINIr5Lgjp998jC
 +dIrhS/xzd8Vebdq96HLgYev3dZD72ciJxXnTYl1/djcfnT6SRItUliUlplnOm9lljlZnJMaBeL
 rfsOTaJI2gfMTkNDlt7BaZ8uNsQWhi7F0DUos91NKa9KHX7IoXL2IjqArXDtBtcImi0+hUhDZWd
 RJvhAbVlA/aC/yhq2XEqZ5mQLSKBrfKKV2VSIUAEu+xancZbZj3dylVSN8jwZ4jh1hoMAdaRn64
 0bzueGdz0v4XWXIV/iK7XBhjVfrVMl0txDIlN5Tw6atrQBzC5zWy/uHCYD0hoyUGOr766xK+pGg
 Ssq5AMpIFEKMc594pzRB/aOykLI/31D/iQKOYnnmUQ+/AHBB0sKZiwqEwPiqjh2VrsW4q5yp9n6
 oxnDp3W3lQeqwJ9ykfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX1SqIP3NkW1N0
 UvsNM5VyCDZV7tPtpyElQqHlgoTk2Y84jaPQmAmu3ob6lbZvXks+mUlntmemkEeMmTdr3NFwqGw
 +/vyo611+iRvmwTjzmLBECIPLkjhUf0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

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

