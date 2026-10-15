Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369653D0CE
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074404; cv=none; b=R8GLebgRcjKhcXSw4THUmic+TbM3D1MsBBUm/rwr5i8s93Oiz+DgQn2H0VtSqY9/S42ft9oOQ40YSXRXe06A5W0/K78kd539BPQtc3Yb8h3iv48/NSLkTglvI5F88yx5meSdcXI3vJ2brVUfQFpoz/o28b1TQH6eAjNnrFqUxBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074404; c=relaxed/simple;
	bh=bioD0/+GRSIZztD0rAdzeKFKyqkS+BVldDDZ5gYLA7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8XKIuRZk7QuYlO0qPQQUImRjIVwLQZJQptwQk9DioaxSi/GUKsqGX5XzFgnknLPx2GYLPj2Heai2AoEMNxKLajhqj1PpAHDtjUJDGhidLCURK4GtYIEnOnbrfsk4ujCYwqW3LOTtxa96ZsZoeUrDEJoIvGeNS1X1KU3D7cLkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw0htt73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKI4hYa5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw0htt73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKI4hYa5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jhwn3510339
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAQibhB3BU4XK9rhY3Rtg4MZdwMJFrdXgDdCbJcLw0w=; b=Iw0htt73hPoa3S6X
	Ojct/r3qln6GOZp7WBO6DEMClDLMEQJRWp7Td8e9zpUQJ/tu+yy4xjv9t2JEpWni
	KSAhnFn57Ir9dor9hoq7wInt5FFDn9ZEEw0P1k/VCX8NvDjxtbCCdYglrRWVN5Pe
	v7VP2wYwgjuB/zvmgYsLA8yPeSNQG4MEIcXNHtJDGhV4HeU3KcI5py/60TE0tLbe
	LO3Y7lCcX8eDDgiAetqWvqGj1ZSUtzRLmtU633jFMfS/n5mwZ9C9v90ZXBSg+UU/
	vXwCl6wlLs6Tj9TtsZNb3fFuHRG0qBUTO8rN0EFljZhP+NIj5xT9JWfNcGJOUycv
	8LozVA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdsafd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:26:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0a64ad59so133290137.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074393; x=1792679193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAQibhB3BU4XK9rhY3Rtg4MZdwMJFrdXgDdCbJcLw0w=;
        b=YKI4hYa5nXAHBtb1w6ov7nC788udrprSeuo0NrWAZg4WBdrrrB1FJoBwLLOq9R4ROG
         GEpzvHuOAlFDTPN5JuySM9r+ji1bmvFgrFNOHJW2IVzykUG0EwAznBN4GFim+uc2U9QC
         3GHztTZpDR+c88GfeGNRvHj6NYJQFP1LfhRu8dDa/9mZfqrnD10qrhJfF5lIA9+Vjo6k
         g8RE62IqMNRQDv4AJwOfMF+6qZcoCwwi8E/LVYaV8UBgao9c5F6b2AYgnmtxfMbKGYNX
         +YQ//z1n7iUZLLVx4us4kN3rKsBgQNdww738UDIy5GR58oKt1d3FkmxHK4zNOggcJYk9
         j/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074393; x=1792679193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAQibhB3BU4XK9rhY3Rtg4MZdwMJFrdXgDdCbJcLw0w=;
        b=05eyuRpIe/m+dSxaPmAgZf8uTeA2ZkmW9maltFzGuqtWnHSCzO9hq21oehvMcynpE4
         z+ySg3xdaNHfwLs0dsRIt3BCx0YC2GcD022aZ5bQptlyTkKG+zVr3xGEeaoCWYgwC7ct
         c34Unh1G/OvJfKEXGSZzNHWlfyhcoA5vtnIp5Je9PfwoCidse/XNFl0watsCbiqSfCZa
         wYw9aXH9KxiuKtMFVTMcJX4BTMGwzSMhQSaCdnA311BT4C8kYEa/TtAz6PK4PqUUcdJh
         mxk9aH862PWN7I7ZeYLhnmjbrkTwLZ/YUWycHo3eThS3MgcK091hXZVc96kXn8TSRWg4
         e24Q==
X-Forwarded-Encrypted: i=1; AKwUvBxui7EmOeDU/XEcEZ80ijEdpr2/LBqqUVzuIKwkwwqXvmOh9FulOJbY8dpRiONFVBVEqjER0YNm+qfL@vger.kernel.org
X-Gm-Message-State: AFq9FYKgBvHrU9hJA9QDeX1z4Er/sqc9/tQRzLJGZtdsZuhclkjdNnkH
	LB9/omQMMCbgcdAQgUpo0SXfqn1lZ0y2hpPYSDyjeU/dA9nLDGRn+22wegXD3kKiW7H5yGMq4ju
	JkcUf2ZkwHjS/y6jUDlbSkaNh+jEnL2nNsgczezoOlscMtKzRURF1ANk78AKpBsWN
X-Gm-Gg: AYBFou1CRE6cdSSUnQPqIbZStVWOWCXr1ZuaXmZSs5PmgZSfQkeJ4dYg2d57xeBOVcH
	kUDfzuOjbQNctFVnn6ttYWjjHHhFE+r0cjRobr0p1K3IaSIG+ovu6YhkhxYphut7gBL5waKVPGU
	+RSniS7kFNDQOyQSXjcHcbBY8bnRBb1lJ3j1jWTPQF0iSmNQmq9DHN6aDF/aS+8jO4RTMzAAYRr
	X8Ldl/QJ+F2PMhzZdIAWd+w+X6wbpNcxZOh5GsrG2JeD9tEwxH4Eu8s9gtw65JUHmAkhLoc4Ijx
	Sa7uO4FEnYGsTGBnn0Q4tqKYzS/OMg0sZND7JJFDhH/d3Vb1I7Gxd4QGvnRL57CHmbGQZQxlXv1
	O8pCLwGuLt2iZyVmYjd690AhIHsrIeEy6CMMgfDArq6qokr5SAgFT1p9sAoaM12cEAPlP5B744A
	nwdiNuChWzWVY7ARXHz4UCUuIMfRqL/U8xLk+o7MQ9K32g139ag+A=
X-Received: by 2002:a05:6102:5717:b0:7bf:d9dd:82f8 with SMTP id ada2fe7eead31-7cb373808f0mr3918248137.21.1792074392544;
        Thu, 15 Oct 2026 07:26:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5717:b0:7bf:d9dd:82f8 with SMTP id ada2fe7eead31-7cb373808f0mr3918202137.21.1792074390919;
        Thu, 15 Oct 2026 07:26:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:05 +0200
Subject: [PATCH v11 6/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-6-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: yusD2eQEv1ueT9lqpHSbScmblJXel2QM
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0e299 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX0qrzt0EHa+Gk
 T2EwwoakMjxW8NLgNV9Pn09WjOCgIEgzUTeu1O3YqdrruKCpFS2PwffGRrABwNiaKuqoU87Owje
 0nKLnrfzcUrKpBdEtEa6aCSuDNsr+NSH++tgAwkQY5rxgASIPlKbmIir57SE6S+WNlocvgx2bzb
 abNCZJ6VVuOM3SbqEX73MbjF+RNFO6mSgQuWUTS8jR/+tE6KEJp2rup3i6VQVwTcvtmeTeWl+8a
 Hy7edT+JfRyGE7l1m4S+mlb59IzRcZI41lCvJR494g2hNTVNbXf2AH8QVmuaHrybEtM6ys/R/pO
 u4iRwURFUTDkhJRk5MDR/0gclzQBSd0px1CGEpfV6kXtGTNiCNC9l02rkN3R2NweXEt3P0QbdLU
 N5NOuhWhFmqZ42EghO93CQvLQdem34Kljw3nPezBttfxpkGDMOxc2D+GhwisdG+/qWpKcRyLxP4
 pbK9E9LoN6g4wpGAuQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXxpRJXXC311zo
 J3zl4tCJ/fB+r2oCqLOErQjj0sxxL11dNXghRmhbuziAJPmSsTrQvB6W7jGSoqxeT6uFFxG/oOl
 uj3dVYnOZvx3NMIvrrX2ZSy+tPnCtl8=
X-Proofpoint-GUID: yusD2eQEv1ueT9lqpHSbScmblJXel2QM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

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
index 22b08ab05b829bef2452cacad9c25eb8a63cda19..08600b0fc041cb09c175bf456cefcb6493171aa1 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -704,8 +704,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
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

