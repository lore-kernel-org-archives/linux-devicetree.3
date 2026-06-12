Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0813FE65D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270489; cv=none; b=WcafNyUv1WRqsSNMORr5GSGB0JWP2F6y/0fjLpmk85kI7jBuax8uGUOjsBCnnzHIiI/gMJAV3MORzo6x/yskAuxZLGbt6fQ0HmdjCeG0nT0bRewKRUJBAJ7sIUy6tK1ecJfT6PC9dhuecpBANSuWmO3oMBnA6wnSpYRuttGwRnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270489; c=relaxed/simple;
	bh=OKx/GH7ZUq9+Mjfs4xDvFsGX2/Vn8N7/Q0k8/BzXAPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3BhQrelwGTB4/kMCw6N25Flt3MfnwMEQ/iieXgngb36cuqBawVgUKV0HSrAHvewlMKkbFfaWrCwezeW1yXhAdyiaWXNfd+Nv3fx6/zf9o9hgbS+PYn5soRPeLr0EIP8bd0zcfcD9T8ai5Ip9yZHn4jg9v0yk0mxiQFedhfpngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5OM1ip8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6vf09Zy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5OM1ip8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6vf09Zy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj7kj3760566
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=G5OM1ip8TUiczHnG
	jV45VH7AZKJhsfHdm0Wd3H13La1OeotXMV4iMo9k8tf1ubm+/yWIyRg75WQTylSW
	aCLi2PfVB7MHDllFoBXBbJYks0VYRPX8kVTv6NVsqy/ZhVSAs0XWudRgY/99kV1y
	412IKCSsXeD3TwVz4ihANy9FgtXjnvcq58dS7mQQhLCW+2TnSQVUcBy4Ge8YOxUg
	USi8m1BM2Aya68aVeLMvEppC8tLa55Xtb8z9MMVz0m5ewvlM1KQM4SRgILgBjmXK
	rJv0voEjx+j3rEWZKv76SpEHnIEXcEIh1zsKpsW0gF4QyLwgzwRNK2vm6HBqc/ZP
	cZq2rg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uu2k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so332824137.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270485; x=1781875285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=i6vf09Zyhx0qOxeEdo+n1eK+WdR/jh08wCpCKUaQyThVVKu/lgXchLKVKgxKFUfTri
         OAf1tA+3IDYjnq56Dzgj7H8Bwd6IJHrKCkQxT2pUif7zfz1NdVGb2BGdvylf+MxDzv3m
         ZLXWgl7cgR58mwireznP6gO6tDxAOyvb9U1bCFCv1JYBgYz6V42JD8Si1Ds/YNdR7ELd
         vwfhjWRwkNlPAiCulvu9UwRS5YFpToRerwEM3WqiuG1OqA3goApn15v1Gut1PVUU1OIx
         atqhg5VMkICCGzf/uqxfqAQhS+STGgxsmWuOQ4uoqxpZI7ROvrFneVZDLv2nssrNZ6un
         gHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270485; x=1781875285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=UYb6SE7h9yE2cnUUPtrU4hlbGLzXoV2tixwdAe3LjTM7o95YcwDBtboMsHz0rFhJjj
         wyPcjHaX7h5GtWkA/A2uuU+WQIQdQGL2pv5brnRVeF5sgRIS8CWIXKwQ6OWsSstcjqCz
         jNEa32XGN0oENNssF6WOFfzi9ESctvBTlnKGxVeIplBYW5ScXPG64Fx14TJxzvICyNlf
         NV1Di0mWq3HTo4BWPWF604gd3wD21jw7oSbjKVDVggB++wJ0akB588EkLau6cAESjI+z
         mSSxIlwK8aG/7Gz+dHAWDkPJRc+NZ50bFcw1uvUL4czjk4XCIirO2HI3i4STVUr++Nd5
         kJ8w==
X-Forwarded-Encrypted: i=1; AFNElJ9gwl9/FiBsS0U1VYynylSiTzmaihGsSgxWps4OvG1R13mDV2GIkgab81HCdkd/PLUsU9m5vQUMZ1ri@vger.kernel.org
X-Gm-Message-State: AOJu0YxlYOediB7ex4E0NnfK+3WUo0royvV54wEZn83A8nYJvkaQOzXc
	aHe0dyvdKdM7oBG03G7qH2Qh2vbQpbdHGh6bRGLPHsm7hW9YI/3ZQuTubsxzE92GvsBpcgfhe3n
	O0colTZqtiVV8JbtXoZezo3c3cVeF+8Q9/ma0mz5VKM9UIvt6sk8IEQAl8dKQGAir
X-Gm-Gg: Acq92OHu8X8mk8+Wwhdg8XxvNTz4vjYXnYP4trJDMLmrHQTFTOvK6CG/co8fqRygzJG
	+9vutJ5ZDOXQWKcDLr4YZOpJLitCarQNvuMSl4rrWcLqcqs41T49DwIVIaX+epsqVt4HFrjiYpc
	hqHbbqsNfumIHohBOG0cA9eoXq87Ex68Rv86g3Gyn8cx5xlCmWd9Fb8TdxubNyfJm3HGuOJqQyF
	P0VYpR2lh5TL1Ad+YNPPNWTOWmRtpWi3dj+BtbDH4wFiw0eDJsgayceL/s8DYThzFRR2SYUdE6i
	9fYrcko60CTlvrvD6TieyRx7nCcqTR8piKU8StzUlx/eS81WCU+7ScoeXz5i+J3BXUof47HtXaz
	EOC4R2HdIIXyiJshEC+IRAZjG/gcJIdWV7iapk9abyiZ+qPR6W6DWZNRc9dtzgdT1lqm3CJEfDC
	wLxwfXnhxsd7fkUn+GH7jTObpdYkVMqO1bhx19sl/15bPk8AG+4d2PX1uWxtJtPg+n5/koz+Zz
X-Received: by 2002:a05:6102:292a:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-71e88c6af86mr1261380137.18.1781270485173;
        Fri, 12 Jun 2026 06:21:25 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-71e88c6af86mr1261324137.18.1781270484709;
        Fri, 12 Jun 2026 06:21:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:21:00 +0200
Subject: [PATCH v5 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-8-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX1VX9y1acq22y
 XWitqOfrHDk9cGDk2veCBTcEBreju6nQxxcbXY6wq0zRELoZb+lbQ5mGXXxmE7H0vMgU47LoWUE
 zSh3KtIsVrFPVvVQwfgHM2WvPxPey+c=
X-Proofpoint-GUID: n5ucYpKVdNRq-Zv6Q_l25HIvkd9Lq1qW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX+TYW7SfWrW1M
 brqzpAo+bS1TZunIW8HKy4irtMOVcegDymgm5L8JViPd4jkt1UfTfjG8Bhq7WsZ8ONI8XUKIAr/
 mKAESN3B80fD9QXx8EcR20KtcL7BIK1vNPn/Vwyq2S3wKbrA5t5ZO3aevu5jlRqgPBGrSHahFmJ
 DEx040wiyk8freJT/EaNWJzbEPBaUCH2oQCQP6McWZyeKni7bBVQOLJghSNxxMnaXTBplf+9gMJ
 lzFPRDj0G9ntrXI5SeclBvjZxNJLVzw7K/Z+cghSI9BC/TM6dj3OzRCd1HKkGXjQylLNVWsk6PH
 lBmyCj7gBOwFnBdyncmUucfhxFPJOKt8hSOwkdayGrAbd+KP44QtfOEgjvzWPEl1ZrGpFNfmDaK
 pGAIvDfM2mnlwuKlasB+G2AECY2IneC467pBZYsFlYfspOH1cGpKs4zQvnHogzPykLlIZ/twSjG
 R7Hu5YCr7qUJPbIwVzA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c07d6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: n5ucYpKVdNRq-Zv6Q_l25HIvkd9Lq1qW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

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
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
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

