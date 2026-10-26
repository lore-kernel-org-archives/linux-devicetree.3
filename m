Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995895;
	b=wdAq93BvG6QGVF0JRRBzbG8iFUkCPyxeZeKn9+2NukTcf+M6/7ajN+AT/M6ySYJ6uW98
	 iBLe7yEKLMiRoWAkcn6bJMuAG3zXNB1AgzLRGwKOwKTdaA5HP0zQnEoK1yTz1fVj7/E3T
	 ZR+2ewgTqrl4Mm/Zhxj53L4Q1ZHHXrvvEKMDrFavSZ/glQjisR/RXVioYqF4iIfrZI8o9
	 hIDjH0sozez9rBGqlgRIp4maW7HSJWEbvSe7e0wTCB3xvlEfiQsTozCYLnqn/DNeTvCsY
	 bKOpk7k/RBMNAzasNRy0gsLlOWJ3Gw1s30J4vPZJ9i2Q37sQSIMdOP8Zjb5S8oHdBiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
	b=IBAzlRl0YacFZiDrwZHBJy0SyEc/WzJngMYxKOmCFgS/bq0puOESn/fV+MX0eYcwg7lV
	 JtXhjibXGNyf0LqYONQRUVGqIbGkz2/b4BvwPhZ85kLuYo5TRIP392w2x5Xf5N5nwIuc6
	 316yDTghzDJH9qJPh2unWLtAKTqhWV4JRt8XIOp9AfmL4L7WG0VFPi+EeJmDQ67ru2m9S
	 T7hPvLCEXwn+1aJWe28H9qeAHjPU9aX5Fd2dNXOH8+ovNzs2TwH+pVsYaIuUeqvhXk1dR
	 7sAhRsqTVhrSdoCSIwsbCLHDJYSOm6UurFf4l3p5X/WyZpn3j9euwGKKnxlbbKnaHrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50521606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50521606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPJp2222515
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=; b=RfO+XRp4pjYRM/xe
	mG9DK22XFlQQwhgLDBfJpX33NFBxj96FU7sl8qDGu+Plw5ex5UktXN2OLXZEcPB3
	lug8o00Xm0AzYhEad9Za2pih0Tbw5exLhKuoCnzPprxIuijvxz4zLfEKcFBfYNBD
	f5+Tb9YCPNgaxfkrq7X4qHuv8gdHeoQw+OyffCNvt95dE6s1lAH7r/ILD/USzVUm
	nwszRM9GZvSc0tqFQRJWBBDN6XG+UW+fGRSaExZ5Y1kMG3hd6Sy/gqDES2f0V+mA
	xysdEC50+zKS6USAkgaQint/7kg0MWwL/gfkLauR2rgrEFrK2k/1zcZdMguReItg
	yLnhew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd8u10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8e16d22d8so47068515ad.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995892; x=1793600692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=Pmraj0p3jc+XiKtQWDf6kGCYzkt+NN1PgXCH1bwT2RHr2fJCk0bvHCoMxljqS1Mh1b
         gRnnjLQ2lSJqfdThDi/IPKnoj+Mytx44S4S9i/3DpQyImieFeVAg87pmKucofPl6eCmf
         mIvG9Bh5gdHMPtTfwD+g65xWUte1ZNZU+lyc3vo3rBtGDpAvzdTez1Se6NwXAsd7MH2s
         DH4Rwrv1uTiHwGbxTi33dHs+NiHQEYdzkPve1eH6QUeNCDXDsqMktzPHh2QN7syNP6WB
         W3daK7/EDZrbwovBrZyGeypexIAPXzxZj7MNxdVOqdQlsN4o/GbqhbRrIwb/BqDC05hO
         w8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995892; x=1793600692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=b2pjU6VHoFJ+mP1wZO9EXIi4c1tlKG1ZcNTC5AhgumPLr1gnkYQQXacoOcen1DyMaP
         jIjJ3gog8J/4CON3JTSDnyAfwCp8vG/z1XmzMkoFYAy33Qcv0fgRXliaADKzrMZ6nnE2
         BYTSW+OtnDVuyhE27wJP/VxKh5+X9gyBfjKQjqVGcWX+KzTHL+SazykyN6trnEHTsry5
         LtVKvgoybInOaMfANs05waUUWIYaOdPX2lQ0rh8+6aOsI9Szfd3G2BSYTy+7zm/1iTz3
         LUEvXklre33dWmtwRZpuXLrb5xzye2Xl5h1jCZeS+0ipsDFp+Gm4vEM9p8J9loh092+x
         N5Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwMZt6ZHnnGLYzNyLRPeXuOXk9j5GyBDKeRWT3UEwq6hvefrpLmdm4YKsynTFaN2NuR1rMYpfRFwRAZ@vger.kernel.org
X-Gm-Message-State: AFq9FYI9JUtjiQnVX/O2usIIy/HEnclTcRI5nnIunWVxVZ7MTSE1929u
	E87cgVkEAnLTlo/UwlsZa8TDBDE6PBzHHycpTmqd8gPAlJC1TSBGJJ/20OWXmx9rIl+wjushyFw
	DW4IiugcmZTIFEDcSZA6I/nx6RnORP9ss8yFbYPV3Drtb9J8pYZG8yZOSqt07C9af
X-Gm-Gg: AYBFou18WqBQRuVUExpRImEXtvJU4WKTuMqccZgdw/keFUoQWy7zfQMrf2l//oeY2ge
	TCDXusFlBZ5D7cpvoAzazymiOa2ekGsXgjTOKD1ySI+0Yv0RAfktnAtPy9UbN9NPtjMVMAkzoaR
	WBwA9e7Rw608jqvrZDDGSRU9I26UBsAnVd0qcVHNDVrWj0ASGnlU5HuOTnN6sojVLQkoNBExQDo
	kmDadBm0z/Cl+cF94xQDsqqtO5QDoNhusYytnD9G0TCFMOjiEzN6QoL5P4gzV6IHeZK6x9JL2nq
	6q40k3DdWCevCQ4rMy/zb4S0mQKRuZU8Ce0uiK6rl/WV2RG63CUXoDY2exZBsE0ZEJholWxMkz4
	OF6FJlQ6GwJAQhYeEA2o42al5azBsGTQ/ag==
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50093415ad.51.1792995892313;
        Sun, 25 Oct 2026 23:24:52 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50092955ad.51.1792995891873;
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:28 +0530
Subject: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=888;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OlbpUMWfalcU4LvUc4XxjyJ0N4RsG6REGtg5lYpZB2g=;
 b=hqaldRzU9Cfrh8WAe0bLtlXt2+O+xAhC8XiFVF+11GcI+fP7EIgtkw/lV0bwk/zrXWsIWG3i6
 OCdlUUwhFkECpl0mDzYq/rh+5qzmVsGCw0XRLE0D382TWK/dkx/0epo
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: OObdualQykkywxTTXjvv5XSEdF-pMMZ9
X-Proofpoint-GUID: OObdualQykkywxTTXjvv5XSEdF-pMMZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX02VPYP+Zkwmv
 D7tViNA9HlC4XqzHcCyjbSFW5dTfoio8/BFv5+4TOEWHwjlx8ARZ4YqvxQY48ksZGq2z71U/UPU
 NBemwdNPzoCPFm3mUsFzTyncumMMELL3OwTm6ArJ3Jkv0OIHCiIK4slamBM52QQUjxSLh+/zxZU
 q291EIi/OlgVQ5dXVDAQyGm6Bm7/VRNVB+3nzjQD7hg47fRNedB8gbS0J4J3pZFTyoFef3M54G6
 2RMKQnhjLPzY5eGlx3tkWoYkUaWOZVCOd8I3QkJK7MYY25kS65AputzGVExr58dsjTa9DSN6/8Z
 pENNkmw32nSm1vRpfy13EHYFS5Nuq3w3nbRgclCVZxM/OwAEUYO0CspVr7nyuS9n6MDdD3jOydA
 tFiwWg1qVkrrEitlg4POvgTN35VCMGSVMiYEwnksoFhqktcMqn7sQE0n3lgHkCBZI6E8ZMbc3n8
 Vnm3jwS4wIvmqzSACfw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adef235 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WCyPByqoPTdveakBLZ4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX+Rfk2p6njnZp
 qOXVCUcbTX9JyuzAoQH1s5YNdR382xis+0PmFGZm5CcUs1yb9rBVRUutNZy3KINTb9S5DbGjIqf
 lWLkAMvkNPiYmodZa3dYj6LFfYHtKqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed
as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
common VirtIO ID header so transport and function drivers use the
shared identifier.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f9056af0c622..6c6f283733b1 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -70,6 +70,7 @@
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
 #define VIRTIO_ID_SPI			45 /* virtio spi */
 #define VIRTIO_ID_MEDIA			48 /* virtio media */
+#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
 
 /*
  * Virtio Transitional IDs

-- 
2.43.0

