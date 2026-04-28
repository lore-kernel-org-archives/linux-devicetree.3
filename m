Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F02466B6D
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386221; cv=none; b=t9AoxQzKtg1xEi2eexKn2NTWH/Z6PoWWI4HVTifCeO1QgZhnXv7yi3gtr73LOUn4B4qZcpYt3WAMeVSA/ajtRAzrzji4e15JCZ9V6rXJMQqH54exFH9BAS0rEk5ev6uddBtTSkl1b4NroVoqoFUX7QI3obAf7krBhbGv2sJckZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386221; c=relaxed/simple;
	bh=cLdgwybwmVheaxNq3A4ptASzy5fGo7sa3nM19lVmCQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSwkqI69M6V1l7JyJusC/ZPEx54RGrKXQCbHzG/HTWzHtcP5xGVrsobvF2Gjfau/1I9YiifH+n0je6iWY+zWBL1EVSJkETI3JoZVvwQZCW+jT0gXAyy5PrBj5yO6lw7u3lvYvBX+UTSUnnyr1UVYrIHipe5lTgklkPmrGaeIsHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQ+wYtuQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idKfXJl6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQ+wYtuQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idKfXJl6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9ha0v2045271
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=; b=PQ+wYtuQpw3oPdCo
	Gv/gVuNnwt/v0F9FkMF60jbuMEHY4L14JYQaQUOwHFH1G3xmd8JGROy1iaQc3qCf
	xacYJ5iFZhhEvfINckpnl7pe5XdKIR8RrXz7NmcKQkcfYMsZ8670/KE+i9433HVY
	I3uzks2RvFKVhlkSnnkcQhsQxSe6Dwpsp2xugO+/dXf+pDwjajCKcGCmOEUySDpy
	Q7yvsCalSlXcw5IhBPFHJd69TWdMafW4FPvkDPWc8Wd8Qr/L/Dxn3e4F1h1+zzVp
	2Opc/mqH2z6oKmknDbAJV3AgLHGknJwt8JpiVaaMnqAYbOAWwooOJgnk7FlbifJU
	5umC6g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgys3v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:23:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f52dcdc90so7880403e0c.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386213; x=1777991013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=idKfXJl6dS8Zzp7sfP2ChRmhq51ljHlNA9yqsinQs464iNOepLrcyvtY2x+R/2fAIJ
         phjga98Pt+GpAI0TR5gTgQbkAYfScQJ2vhRxhPKQvjT32g7quORhZfB5yxAkRUQSNbqk
         Peg4thCXJf2IZ97cglEVNw0EhUuiAgngg9zqTOSA6EC+YcI7OGtGq8BGD67ejUFvv1oc
         Z2SURaOzdqLAz73lkD5/GNrFpdn08hQDW/QxwfqrxFohLIzwpd6i12bZIhvOoKx/hsPB
         Gk0sTN1qLKpCacvg+m4Joqc4PLj84kA1QPfIsKbR0GWQZ1N7XlfNUTmzG3Wwg7trSGPf
         D+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386213; x=1777991013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=sgXtSK7LZ5tn1mpmeE28PZTKeXaDuq51T/ymHYFNzP82AjcM2MMSd9LUAsctbdlX0S
         uzvw3P1OI+ayyCIpGs7CcEgQx2m1e2xOJH+VVsQIQk3L0KaiJG/WkUlqZiaNTOvZgDsL
         r7xvG4QKj6MVlbfyThZzdHLAZref+/r/8uI1d9tRV/yBo3JM+1KQoQhrpqMX6vvqnrNb
         6+L/TVZkJc7whaAbEVSqTr5GzzXQMmxPJFgBTWkBRCT+k5cz5qZF9ZmjZlB5zNoXFyOJ
         cTxNNLXY0LnlxOmcvIz+SU2RIeuRAp63XXdfCgJLL/5h9IvxtPZTcO+/KpJukod6arvD
         xLIg==
X-Forwarded-Encrypted: i=1; AFNElJ8XPA8TZ08mMUnr9ipEgoc94/kK7z3tjoiZWc4kuzFYRErB9+KxcFlvZxG37LgGIJ16yvSFRFRZHl44@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgLEMkF3TqdW+vO8LtKI9kE0ilhNjfvxg0488LgJPLysMNO0F
	3BamQsDdZBuykHzAHfAk4aQjg1NW5qqxhtpuW1KtUS6mcYXiHWbaezk5eltipC7TZrsD8B5OEi9
	jtPwP6SO/Zghh4wyd6PmryK+i/7lYHh2Gye7LTZB7XVy0OyR6hmPNR4eIRfF8qcMd
X-Gm-Gg: AeBDieuO3iVWLT2Ud4vzP3l5wh5Iuao9JUZ/CKFKfaz0ql1JvAiAD7ltY1BsgJl2XKW
	H8MN7AV+PMF1HxdbxYJ2frE7S7+YYzXFq2Syd8wI2YkqcCqkg5i5bStUk1TMclRgAufGPwrN3dg
	Z23qrkBfRLtLYCiHl+4JlYvXr52efcL+ODp3V/RBn+ddY1w6+clshLOL0t50ENjPgAjX1hywIpO
	2Je8J0gOOFXPJfbjv7qu41NEm1/SllQa+WXDIERm4UHLZJy0yvr6q2ds0hHFI0VxOKX1IWS2pJ1
	pWOVpHcTiwCzcEAQIRRP95snc+vKrBz4hgnDVXpdiNV4Yxz4QMY/xDAimidfq6g2wMVbT86DDTu
	EPWe/u4iCu9yJiUaNPeospRn9uA/fAyh7nODIMLqxnTvXzWri/7Y7CKAZkgtYHlwY91o2wO1C1j
	lqtuvqhLg9e0IGz4MmjReQgoq+eOI=
X-Received: by 2002:a05:6122:4d04:b0:56d:b50d:3ee7 with SMTP id 71dfb90a1353d-573a55191e1mr1867603e0c.2.1777386212904;
        Tue, 28 Apr 2026 07:23:32 -0700 (PDT)
X-Received: by 2002:a05:6122:4d04:b0:56d:b50d:3ee7 with SMTP id 71dfb90a1353d-573a55191e1mr1867307e0c.2.1777386211467;
        Tue, 28 Apr 2026 07:23:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:13 +0200
Subject: [PATCH 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-8-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Qw2rXBOTb4-5Mus4eG_CoXta4uxkvOh7
X-Proofpoint-GUID: Qw2rXBOTb4-5Mus4eG_CoXta4uxkvOh7
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0c2e6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX5arB6DWlz43X
 slHvsiwsgvs77hDD/RQycfdmWBDeJZqAEq1tuJrzA5OSkqggQQUtemH2W05b0cnq5ttgtPhtnAh
 1u/CCGZgfokPLMAe4IWNmFHTXmpmJFXHQOdQKu8muMoUF2Ej2WHwyUSxX2KKb8ug4gMspTdlvzt
 7YrLWfv6DN0Ph2MYCOWvj0qh2bDSLcJoE7ZtZxZNE7wtKqLVJETaN/lV1Xih4E7f5lffPy7KRyr
 Zju1Bym2rqydoyIafbvnocVizbRceU8tKKjpwwZfpMAL5z9JcdvbLVkJg8VyLyF9VZ/oqobIZsu
 as4wjl0H7JEL9mXVJi5R/xJ+aNEKwCYcYUziG8Ij0LmnTKLpSIFuC42bXrCI8w25T7ywTTM03Rp
 aCEUGluU3EU7/jZpufFbISgjwWplI9wUzosSJzB9og42lArpjS3OuS2M+ZvZi04vrrVS+V2jnKJ
 v9DQwXoQPu3qUKyDS9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

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

