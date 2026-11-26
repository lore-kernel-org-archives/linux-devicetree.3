Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674673;
	b=JJP4ZQ7BAQWh8E0OX6IKVmrYgM/RKOBetQ9PeyWOb0GstSgSdg7qMMEsFw4nmEtEGn22
	 VUDG2nS68ODBlOws5oz9MxJqtlQpmdvzaJr8IPAIAXgOGhxA9FR/JOdeNIYs2xA6tvk5u
	 owMhPANiElvGO7neEgqWWQK30IDiDDF/l9WXCnn9rHnQpRkWiV/V4L3UmWQ1KngcPBMAG
	 2/q6iNhMCtTT174tURn2ztE+ONC+414a5Lt0HMN4WHGkEFOSAzBO1BNhR9yJ7ZfI84Tdq
	 h7my2wVNdcTGhq4b/yGG83jrIMyJSIxnsxiuWJSf+/O31v2qKRf4mncZe9YHbyrA8pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=;
	b=RcPUulXBE4HeOSafCWT5bhnMoxk9aN5bJEYV8O5C7PER7p9nD6/dEhPqAaOX6oSCCStE
	 UM12xuA+ZyXmg0ANKS1vX3pKk/ERpDy4TxDShHav4RUEpqkKCXDrX78j6hFm4S3GYCxgT
	 BpdWVHnQjk2bqBdMhuYzFVti+C6CCeFQ3Q+TyVlrGWUusqKAKlMSndTN72nWQ5u6u6R5A
	 9Z5Ttsl8HwBl2cOJbRyGNmeafhVpaE8l3gtlBaDgnk4sZmp83mpcc2N9q7/Fo5RyOvZuC
	 SBZvxLx5GaTQtkImRQxktOoEe6Qs/lAjfNvMtCv4TumI7I/0XfYNMEfay4ot54fhKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o4VgiSc+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLIOgCpe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA90606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA90606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o4VgiSc+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLIOgCpe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ373Q1171850
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=; b=o4VgiSc+IjlJBprL
	P1sydzFuapof3HtAGtCTN12IU/F8MpSEk/tEuOel+FQ1pyS7Qs9I0WFKkTTZYW4g
	eb3q40OKbXW+Wa/scO1nAUfQZZOJIIFLuVjWyl6dQGcPG9S3GZ7NYsuAzm2lRx/O
	rUT2vtAISAOGdcX5b+VWVRosf64Vd8gx7qU6+1dVjF031GO2JQHka98WedSzhtac
	QalGctf2NGvDpkIe4eFmLXaKYvfPdOjhzuwWvN5pjL6qkJkzLOD0pTZjdW4nBGvl
	McE60gJxTkCqREBrnhYxtmy+GxPBMUxECOCRbFSlDCiFGjCO7uK5PZ+dY9fYf3P5
	/EttZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukv9ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f05c68629cso44331075ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674671; x=1796279471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=;
        b=KLIOgCpe6uNSXKoWHkU8e4VYxybLAUFh4RjJ72Ep8ac6SHyO+YzIr/GTWcRIRzhSbg
         xZyw4/ltfg9b+BFDbTFwVRd257miQ4AQld5uqolmbGO9zMiClPZeKpn3nk9PgnjSP8Lj
         FMYGgLEabKoAyXzTNw1JWi/G/wR8pGM7KAQuaVMq5kDUPs/JEfpIeysdMUjQz2atxoUJ
         dsmyrTA31Gpu/u3BETvaLdE/bacQV/S15ZfJLj8UIb9h8i6O7t2XrNx5XY8VQH5wH8Qv
         f/LRvoqsYPNhhvMzdSlEjKA2uENEKpL4vbqA2pqx7N3gM7JsujTDTwocdwcY8R6VIprP
         J+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674671; x=1796279471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=;
        b=Khl8SLe074NdqKnyu3QH2zn/97rfftuC4jGTKpucbRf9dMAVhfoR7plXGmUEcfjp4J
         Sp35/nq+FuK4fTx9fw8KLN5VyqyACyS3Kiatc3CBQmFHclYVK2kBCU+n+7c/xsrCLxQS
         h7dZlHnBr5dbbBJ2i+GqLTiyVepVo5wXmvOymv4NnMjAbJQeIEXNJWvb3XOFJaGmZ41R
         carPjqjQPY00mhrHaNnhmFxGQY/j0c+z66dPIWmWez7b77ebP6joXrceSdZB0sBgA66E
         OnIlj/G2xrYixG5sxzKvFRqbyI99HVJeAYeJDPhSS+sqGsf8s4mHZbGPt6k9tPm58uND
         naqA==
X-Forwarded-Encrypted: i=1; AL+hErHanzE1PULz1qjXLMLgplKGwBF+qNC9cKG+Z37idQlu4td2VGtuj4lt3gUQeGMOP7RY1sCCWQb4F15z@vger.kernel.org
X-Gm-Message-State: APuU4Z/mnlm4ZLSR+pUgJh9RN1urK3XoQ4s4joRT4eKDWvD75xzpD0nm
	07bcUrLzgjhP/zTxTTvbR8Udxhcy8kSIojkD71yfTE5rviKUMXTOUZ4gRZEpQYCbdc+oIZdMs2M
	1KzgGR/D3vWtT2IjKZdKwAUh4KaPsHWvCW1FPRUEjj9oQ7ytTFnZ9UQF7iWrQLm2m
X-Gm-Gg: AZFdTZdKblMB1GqyIbIABREVCMx9jVX8aZDizPikEBS1KrcpisTXer19s9dRxBjK1EW
	Z3p0httsEAaboCL1xHXOAUYdX0T4UGOES8k48p8TP9TlQ18XqkwB9YTbTJiiql3lbDWX5XJgOeV
	OJC6w6YkKGw0EV7LpupQ8aAoPeEmg4Gpv52H/ek5gdJq3Nh9RyVgA2U07kkYNGVsBOpnYhHKdYZ
	ztOZBZVRYI7XeIQQ+c3FSRyANS6eKmQLWHjaiHEEp1wMEytsDaab5sz0lQx0usw7YNxz3E5G4qj
	oViFOj5dmIxjQEtV2gLFUlBtSJZW+T+9KUGk9+OZrlAyx6lzjy8RhusAzvmmM9d6Z0TSqY766Te
	IYUI/KFuqaft1wWuFkuTmD+dNxaxqgsbvFNc06GcThjpaSKcijL9Rdcw6piZIo79E5m2N+sf7HW
	mqpXL1OPzs
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr219979685ad.2.1795674670406;
        Wed, 25 Nov 2026 22:31:10 -0800 (PST)
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr219979215ad.2.1795674669896;
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:20 +0530
Subject: [PATCH v3 12/21] drm/msm/dcp: Route HFI display events
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-12-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=2910;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=VWK4/UwyAvpFlPWiL66iknJDfq5LuqTWaIlitzv+KBg=;
 b=GxHdeYgBOWvxunhh4p7VwZl0lWR2ttSQn8vZyq1yzTIeaSYkODpAOAb/+gXaFjNy8v+Q30EUB
 /Zmw4bxHQArBfPx9XKKJNFWtDQSrtguJh8D4/Bx+2dIwA3sVIJb3w7/
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07d22f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Qn8EL2Lg5JFZapOYTycA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Ah522mH8uEv0NwOve3bRQ7uncS4Lht4P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX+M878g1mJUDS
 Oj4b7Azq4a9qiIag5bxCywFnI7LiKswb/klGfGSBm4NxALfhWTKld1M5x6WXUeLaCz8jwK6QBh1
 qzK6hDdnhV1vN8b2u3Z5WNvH/kNVOhc=
X-Proofpoint-GUID: Ah522mH8uEv0NwOve3bRQ7uncS4Lht4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX77vacYk7caIH
 v7Tg8WBirwAqLCZ2VJPVjLO30rfzBf1kk2M0ylpSpK4b8sEysN5Z0dUfmAqoSTaNM0fmogd49Lt
 NH2MitS7iwAkJJ+giOr8sRbWnYZZLVITOx1hlVdhS+nb2Fos3c4GzxtNFJa19pBTfjviP+rFL9b
 5BkTNmvZrDrGrgT3ibcVFPDRkJBfFIcYI0BrdsCVMNP+Yi+gzKId77wTZvvgXiiPG1KBoirwvyb
 qiw3wmkCP401hPxRS19m/IOQbB6rF+JrO8KeqORHDXrZYlP9xFXPbiqmejd2t4rc/nAPHBvXcYi
 JmmUpOqJuMoivQLOpaL7lcOxwNN7CrdMJff1VM+IWfmJ57NqS5HdQplU95HvqORsI5CnsqstCcQ
 zY6qwx/O7cjdnl7P/+bAYkYeSr0J3oXEjjgc0a+BQ4/rktqY4uex1dxN1sKzfRi7fTJnGIIN65A
 /q7pVwHodi+i0pvxk1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Route asynchronous display events from DCP firmware into the DRM CRTC
objects. Without this mapping, VSYNC and frame-scan completion cannot
drive DRM vblank and page-flip completion.

Match firmware display events to the corresponding CRTC session and
deliver VSYNC and frame-scan completion notifications through the
MSM DRM callbacks.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
index 1a1addd33877..3d0e15cae038 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
@@ -19,6 +19,7 @@
 #include "dcp_hfi.h"
 #include "dcp_hfi_priv.h"
 #include "dcp_drv.h"
+#include "dcp_crtc.h"
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
@@ -260,12 +261,41 @@ static void dcp_hfi_store_caps_payload(struct dcp_hfi *hfi,
 	dev_dbg(hfi->dev, "%s: stored %u bytes\n", name, n);
 }
 
+static void dcp_hfi_dispatch_frame_done(struct dcp_hfi *hfi,
+					const struct hfi_packet_info *pkt_info)
+{
+	const struct hfi_display_frame_event_data *frame = NULL;
+	u32 sequence_id = 0;
+	u64 timestamp_ns = 0;
+
+	if (pkt_info->payload_ptr &&
+	    pkt_info->payload_size >= sizeof(*frame)) {
+		frame = pkt_info->payload_ptr;
+		sequence_id = frame->bufferflip_index;
+		timestamp_ns = ((u64)frame->timestamp_hi << 32) |
+			       frame->timestamp_lo;
+	}
+	dcp_crtc_hfi_frame_done_cb(hfi->drv, pkt_info->id & 0xFFFF,
+				   sequence_id, timestamp_ns);
+}
+
 /* Route asynchronous events and capability packets before flag handling. */
 static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
 				   const struct hfi_packet_info *pkt_info)
 {
 	switch (pkt_info->cmd) {
 	case HFI_COMMAND_DISPLAY_EVENT_VSYNC: {
+		const struct hfi_display_vsync_data *vsync = NULL;
+		u64 timestamp_ns = 0;
+
+		if (pkt_info->payload_ptr &&
+		    pkt_info->payload_size >= sizeof(*vsync)) {
+			vsync = pkt_info->payload_ptr;
+			timestamp_ns = ((u64)vsync->timestamp_hi << 32) |
+				       vsync->timestamp_lo;
+		}
+		dcp_crtc_hfi_vblank_cb(hfi->drv, pkt_info->id & 0xFFFF,
+				       timestamp_ns);
 		return true;
 	}
 
@@ -273,6 +303,7 @@ static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_COMPLETE:
+		dcp_hfi_dispatch_frame_done(hfi, pkt_info);
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_HPD_STATUS:
@@ -950,6 +981,9 @@ int dcp_hfi_init(struct dcp_drv *drv,
 	struct dcp_hfi *hfi;
 	int i, ret;
 
+	if (!dma_dev)
+		return -ENODEV;
+
 	hfi = devm_kzalloc(&vdev->dev, sizeof(*hfi), GFP_KERNEL);
 	if (!hfi)
 		return -ENOMEM;

-- 
2.43.0

