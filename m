Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674265;
	b=b+TgCAjgBECn/mKFd0tCYwvBLPC/uUgi4T50O3aKQ0MMxv5aYIz3wjofgjO78i/PAhxT
	 SWBSODX7pP68eQyOGeDyXtei4OJIAAaSVWzEjnX5GVTGSFPuFaIu1LFxwSXCuIvXewa/j
	 BOP5oehIQox3czgo6meJFQRL3VaH6ianClneGxV/rMGlOS1LzLIwr2kEx2DjL9WpScPgw
	 f6KchncZpz2bhjPe6/SVJ4GNyVlqJS4yjdpRh0jY1xQ5TGKfNMEmNruTGa6ciAGRu0F2X
	 PQROWlBuS3TY0yMjEbQbD0x1z7NbuOETZkdkddlM8gkaUuets/hyNDTymrKZETOgBGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
	b=fcXmNAQ3EDMOWn/1e7j4Bhp7WbSUZlbQP3xoasW0yw5+e/ouCAwpKZ+/NNzsRSNoUqnT
	 qHx7IBUo211pc450bK1xwVmSLIG22+CHV2SLLUYGVE//YVcbH5vC2BN+6Vgpu77nzJlrp
	 3Hoy7yZc/eG7IpQITHnV12yLk3td54xngReeg+R1uqfNjWJNr6VLBGnooBx7VMy64H6WE
	 4pr9yMtI5zlbJHseKn/rccno/eEnw/m4k4OzzEYXTY3dq+XHg5x677IRX/3n0q70glGqY
	 crrlkN+1IGkPYD8hhb2rYs3BsxZfK+WpLaahrxT5wrpVsY/xUfl/DaSzokz3yoKDfxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdolxAgf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD+zAS98;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F46606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F46606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdolxAgf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD+zAS98
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36ZqH1647924
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=; b=OdolxAgfqI2pDZuw
	7lIVRaBaousaXsnNZ+J5PaZizpOz55gw6EmPH8qKWw1Mogj6LTpRSmawjc+FDa4w
	xGb/KApM92k6X1bisxZbLUUwblWajRykzQl9QDwovTGnBYek/nC+5tlDE0uB8QFr
	VltDBQILEM7X0BwghxaLbux1APLBF9b51+7ZPymBtPF3JD66KbXOOfZ2af92J+Ky
	/0Q4xOCGg4WJNrVJYGNj0X5NA9YjU/N4UFPB3092UastC8eGRXFMREH6fxZWHAM2
	p4NQhzQwja3/nr25OdOZnnlL26PD0JJFtzOPSfH95ese/O5gMQdfaWsq0QdtGDED
	OBtP6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahu1af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:24:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4ca90ed93so2992625a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674263; x=1796279063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
        b=fD+zAS98uZu1mfv1sTxb7hkM9pyfPQHdhSDuKvzli2xMBoO8ZK/TgwppXBB32mNhTz
         qwX0dMGOj6fnRj65WPZTEF9E/6z8v7K0ispSKcuxsfWJqAPK9TzdBixXIJOIArUJFiz0
         lxuCWCM7ety0U8Pmz6dOjqPaTaKxz4q+D5T2yWaQ9vkkASHm+fr4gZ0fQ8Oov+BPZvNk
         RSO5mrHQ2CpXSJppNLMAqL+/dBG5F5NuUKjfn9LXblbfxmW8wZ6rthDXIbFNKnniiSkL
         CrYQZ1ImhCLRAmnbpGJUnTiZBe9ucnDp/cnmu+PzpTVyl3X/MoabfCLyItJh4FlP9SKc
         P6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674263; x=1796279063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
        b=0lhKPaLv+4kP2nps02E36WPkXLASchd1P9SRKnsBWVwwshtbFVKaQPzi8aJOUk1+nd
         3EeZ66tnS2v/mY/EejpFbbGaV7oCiuwMx3HX+7E2aJtHWZE97YewwgIDy45E15GrXqrq
         uAadbgXbsjjkZ4YYEWv6UMk1tvVuwkVpZwHOF158c4iBPKz/JZB4WT312XrQBNIBv/dn
         4v6s2Fpb5xymIZXILoIGJDB25syN36WOW65Na77Kx0ONIRw6DMJ7QqojhHqyfF44BAnM
         I9ZRCPg7+BGTVOESDyKr7ZRQCpq7RH+j+XLqGvIRprrn1a43KbYic4aA3EM5u4K93Tqn
         GjgQ==
X-Forwarded-Encrypted: i=1; AL+hErH4Mrs1hW6RIhyP0Ol3AlPRQi4Zs1e+9Zl4dvTiidkKTN8q5B0QcXBkUZmQcBpJeVGqG9+MhWLtwqk4@vger.kernel.org
X-Gm-Message-State: APuU4Z8qydKWwq9eZ4Cfddp1mDXTgUefhnXmyeQsTUW6NfMgGctBXvza
	Dj5pX5V4GrCCVh9fX9m2axDsMUgiVuTDsp3Agj9th84prVMvWrjuWOVmpw5I9wr+sgK2Sr6sec9
	bUNPLcVEoISDB89rBTFU3fNfbsIuNrZHprZkVimbGtBtlDvZAHchn1JaHzJ9StlNi
X-Gm-Gg: AZFdTZdI7spp1/yftbpMRrXIcQe82HaCA4y5U/nIICGP0XT75tyoYp4UhYIEJr0HjVf
	3v6SCTBLHXz7tOt8Cj3mnz93G/yx/4q6D9gvChyjy8H64xy+3a2RF1Efdx/NnyCPHMaHAUeUcPu
	5YvxreEqeTe+ipkee3TdSTl4YMNvbFK+71W5BGbSRqIU29JR6/3dwWMZp0NgWBVb9NG/Vyx0im+
	CG8zhd41offegTcU1Vsh+U7SmJFoWySo5739RlWCvLxatYnwWLQWo1K1rwpVUATLCQRbhvWuUnl
	NgN8C4r5mSfTHN6N8YAziivWV3h7O7ueDe1OQKrWBgsqDr1kQoZwP/VppKthf3S3AwGpXtICQd1
	qog0bdS+IhS+Q5dnsvbSgkiWph2AItWmrtAzih66mB2nHC9dcoW9hAq2MW77m3eurleMc4RlMBc
	CRTH1Z4t3V
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr19232484a91.65.1795674262888;
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr19232454a91.65.1795674262406;
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm14988015a91.1.2026.11.25.22.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:54:00 +0530
Subject: [PATCH 2/3] virtio: Add vendor-specific device ID
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
Message-Id: <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674248; l=1122;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=GarfczuQMc+vTCQFOwF20nMoLmGibGyTdxH8fgzaj4Y=;
 b=xLVT2dFjo27JP30KZLWo89YMNzpxh6pFxM2QaR2byRBSxWn8dA4BXKdb8GXuJjoxbEQrnxjmq
 O96QgrXg7C/B94GfmaYJ7hOthasfXBM8g50jzhTiloiGHkGBoG18Kl4
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: A0NEgBWS64y96wCPgjeesoXbKXww6Mlc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX2sEpvfFEBDbX
 jnEmcRR9PnZwdl6KnzRnhW4x0kbW1n8OdJwa2z0WrOBaILZkqMtJj/oi81NnJWyYGl+Trz3M1cy
 jriI2EaL4kqcGLCLrozUdHyYHay2Nkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX26poccuw4qF8
 q27oK6NOgHyTY7SU4wk2uCGyoKB98aecGd8Sfuza39lu3ZW9KkmKevHL/P1kcMovZ2HDLKLapFa
 5LVPxtvGsgz/2WVWFpegXzg6eaL8zlJSLwjSlKfMzjIo4fqMslcL9fJvW4jnllrY5VW449Rr21r
 5oFWJBqnSZF6YqA42bAIVKutyTSxha5OsDy5s7/KGNDMfO2WiCW5D/3VbNdcm0tWOBUdL8th/k7
 /VhRC3A5HxTntd9W9s0FHTDLfW9QGTifzGmoil6OCCWBbN6fzYVdWcxS1ihRk8MXmADERXIlXU0
 bJe1JJlSmGBq8nNDMkuN/GY1M6Va3qEZddalFt5d1mKPXyVTYeCpFsB/ojp9EC0pmja+NWngpZH
 sl8cbflEOWa8GuZ6RLY7M70P+iwSATf7TF1X8WtMYJxcEfgtHDLErCe1e6p1kbgFOWeVyegRL6C
 ssM5S7FE7NJm4WRd2Gg==
X-Proofpoint-ORIG-GUID: A0NEgBWS64y96wCPgjeesoXbKXww6Mlc
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07d097 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Gva-buRrl8eeyeTSwpAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Define VIRTIO_ID_VENDOR with the proposed device ID value 52 for generic
vendor-specific VirtIO devices. This allows vendor-specific functions to
share one VirtIO device ID and be distinguished using their vendor ID and
platform description.

The value is proposed for VirtIO TC allocation and must not be merged
until the ID is formally allocated. The DCP function driver should match
the generic device ID together with Qualcomm vendor identification and
the DT-described transport.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f9056af0c622..9a8b6a6a03a4 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -70,6 +70,7 @@
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
 #define VIRTIO_ID_SPI			45 /* virtio spi */
 #define VIRTIO_ID_MEDIA			48 /* virtio media */
+#define VIRTIO_ID_VENDOR		52 /* virtio vendor-specific device */
 
 /*
  * Virtio Transitional IDs

-- 
2.43.0

