Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85C4BCAB0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921674; cv=none; b=I0rOq3jwe4aNwBEII6P/+ON7u/q47RkB6uskND3xGQJ6iAp+8LZubOLQat3/dzmyJ2CQ+LnWLX+FaICB6dkkmR+YXXwwnlzDrWq4NtodY68DUNC5E5nG+lxKJRolE+xMbC9JgffLvD1Q90c0G4sf1H9QA6I2j31nKw7KVVf3HV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921674; c=relaxed/simple;
	bh=OKx/GH7ZUq9+Mjfs4xDvFsGX2/Vn8N7/Q0k8/BzXAPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwEPLkQAvEdj4bmtYppe1uVysQfIb2g4G7+miP4RGqpfDi+aYiuSjng1ePASYIdA/I1tYnqxz0zsjNgUN7TgEVHu+NNeCIRINx0+YbQnhHMToIjDSGLJ9ZvdAsPNs9/eptF0ITvPV6XPAQk2ldp425GOltJLio3J+TCs4qiVTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pq5NS/nq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWqf3BAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pq5NS/nq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWqf3BAv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoB9g1468628
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=Pq5NS/nqw8AXlglr
	RFqPdkUwA1KGVsv7K+LRZtwF9K3E1Wcxk47eHkwTdnaldY7gZWQ6ibH3fP9dqRJi
	pbpa0Qh1kylkdNRlU2sHby03bKMc9gW7pcNAAmkJH48C+M/Ba4cjddY6cJ0FheyI
	pukFFt6cPC+ejY5Em3EZrEzYJJdnGgLy86amxW0eQyglo/R93w/eir4Ttv5Ov7+Y
	yhKQsOPbFm8P4KFGopv9y5LXIN9IvvMNq/SSvDowpVFLYJnc8VbvOA01OWsX/Xsg
	ntzgGP680b8EXEOjhjOtVLulFLNmnvCv5G829Z5Isn7bEB+naQI+CzXe5Y1Hhl7D
	7scrIQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sn1ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:01:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so256833137.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921667; x=1783526467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=NWqf3BAv9qRIWzZf8h/mF6PFN0IHK/ncjXBxW8NgbMyYw+f0eBh2Mg2gXdz5oza65F
         BlcInuMu6y1BBBMY8w32ode/GwVbWEOx2SmcIql3QNmQixjIOxWA4B2hN86Gk9sFXAqn
         foSXOqlcD6+oiClwlxds03ii2JL79CZ72LiHBboeDEkY5D14D1ypIJjhbZi35U80V7fd
         sMd5aOGb4zNVEKV1Rh31uKmKrHaHJOTYj+EQNoD8rnygQdH1ABk+zxdfjVS75R8NGxXc
         BKzAwWEU17ioMtOP6lfYVaPoW3gxX9lLom2gL4xJIU9ibrXvd+I/o0XFYP/rMWuHA2np
         y3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921667; x=1783526467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=AZpjPiqs/EEkj6xMF6BWLPvuI+0fxzx4sMRTF3SmNIAHmL+M90Iw1IIFWbumnTJ2FA
         gY3MCSDqa7aolym/X5Xh7hq6ZX40GtB094gcmNMV94b5zKXi9yXyKk93SwKAbChYO5Q8
         4k5HkmfARP1TeKA9cJmV9eP1wJ98VxT/zxUsY5/F6nijFVS5r56y7Gvo0BBQX+itoGJj
         4GEMqkbU5LgV9ZtvHZfpFkt4BpFOGOeWqEq3qjMos9rhjwH6w/S3x/fWPkoN6nmENs4+
         GcAJVhcbM1KUfmGhyL6de8PbLc7qXwgCyGikGAWs6+4D7pJHzwEbPOeGbHHyXvwOEGbn
         BhNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsaHmXFVjPpKISjOrTYx+ErVHcRYWOis2s8cYj5+51lkz3P6SmI+7PGBaRqeblCnuQK4L4Y91Iongn@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlvcHrnKjAgUDDXE2kYM0/PO7rcYtl4VNxU/m2acLwfxAOJsd
	vB4ewCrLHfZayrGlpBwbER20BhGEvJcCCtC59Jltyzm3D3DtAo7vFap2rBUmLi+28Yvy4Uo9O3J
	ekVwR2D0lPpV/FHuLwl3t/gqqcfsMIm3H3rnaYA8r7wDIFEiGhfvc7TPYPIlm2GZt
X-Gm-Gg: AfdE7clpWS1jmzBxaIi1yNYTKM97X+wEmkxfTnAoM14lNF2FaqUoeIub8G7zJdW4EN3
	BzHkbemuo+n+fkEBTsE6hVlv3mvrU6Z8MUgfiuSW9F0Xx5x4htHnxMHHlafzHdJPMSI4yiK97+s
	9di7C3dAggnoWsTzcnFUtTlCUk0bu4rbUgZ+hpfIXw58e0mYXHVmdfloso+Rrg2tJ4/BoFwdIbe
	gIw6i9/RYYZ1C8eX5bMKrpcYIfVUk/FNGb2HHdVWVJgDQGnQa8Db/e7gmrF2/v0VzU68HH1Pc3M
	zdaMx0Luzo3HAVqAb+Bo73R+uDT0XhSEhC+0UTY92KH3L1unF7kMjU4/Anw3B0UvnJiiqwLFJF+
	XjygbEZG71CTVGpAuhirel3PEJtU0PRoRBrXux7MnMr+KTOnPDn4KaCYNRqVDALvoYoBafmTqc0
	u2sO52bLNXjo4m+Eb+wSI2Qh3kcnEhUh1lMviCZdT8pTzMpX5ji/vZDINbAbmVvMM=
X-Received: by 2002:a05:6102:38cf:b0:739:d787:be9 with SMTP id ada2fe7eead31-73daa349057mr1034952137.17.1782921666845;
        Wed, 01 Jul 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6102:38cf:b0:739:d787:be9 with SMTP id ada2fe7eead31-73daa349057mr1034801137.17.1782921665861;
        Wed, 01 Jul 2026 09:01:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:01:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:32 +0200
Subject: [PATCH v7 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-8-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
X-Proofpoint-GUID: pkMzvXY_qBrppVncUv1SJuSppHPKFJlj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfXzS0RhX5lZ7Rz
 yK49XRCRcNqJd4AKY+nFybJA27v04G2vUofqtz7VOcBnPO4DdtKwxLSPbNNhRkD8poM+svLu9nt
 dHy5oGL4mSuevrzogdXKM6WttKIqUcxgoTY2gRLW+N1j3RgqgAA0AZziU5c9vWk3Og40N0pNh0g
 IurpkgbyaLWHsyo6Pd8Z8pFliCeSjrcHJ/q2v9wPjmolAgG3B3aLgyqjMq45mnqo8dONXehmUBG
 NgOVMCygHWEe1C4Mej/fzg7y7dhYFwOzrS/XCrJsTeSnGAr8b6Kislkr9anoSkvtrCSnuVQNHhK
 ANbcB4NRQTKAB89LIAcGAyQFNe338RtlIMj8Zik75M+4XLnfnDn54etJIlWUq9EtoILfiVukdL5
 PmqzaP6ziPiBpxPgaPaGrM7sJprlBjHti+ljA2DRPHrwg6yI73eahuPq4Uh3jEsN0LSVQRnu53z
 OI9NxiWpfI2XHqVQMgw==
X-Proofpoint-ORIG-GUID: pkMzvXY_qBrppVncUv1SJuSppHPKFJlj
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a4539c4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX+8Rn9W5RgYkf
 AoG3RPS9+8nK9aCrNaZg/UbHU4E0JdhuCr8otWQ9mBw7bujnmU2dTc1iStj1/HGlNsOnof30ent
 GBprVdwgwb7nJ4yzbbklvAjV9DYyBdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169

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

