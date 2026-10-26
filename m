Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995872;
	b=DDspGb2hSBezS4URm2317yC4UtW/cQMgQ4ZtUfdd/mJmKvr0ukPB7Npgca8epQCpRZwI
	 Z4Hecm7+7K76hBl3MKmg9JRphi/wQz8vQEza9iYrwM13gGD0OBYzwaPoQA/JkzfSKjD0Q
	 0+1WKIFyLaiz21i6YHJHcd538s6bYi1/PsJMmrDb8hFwiPAc+oOZNcsR9nE0LiR8zfHlQ
	 L+pU4JO+Ce/sTcCFqsVKXZHZBxFW7nl3czOqRbPQ9ern5rufinMegmPo59oh3adFd7QYs
	 sxpIpZyEvNHQ4EV87PwV0qexOlzJQjEShUP3R0c6TsOt2+JOq9nkO8JTu/zIQqKjXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
	b=15hCMeAZvLfg1odDNwnSZbGATWZcLLBbdBi/xD7FZQ12jJoUWU9GuTBHksSbbVUNLNhT
	 EN6rET9s1vgCL203eWuwg5sBzY9cyf6nrofdpqS+nPJ/e0akO6eIEMikAhCFo9uvHWy+O
	 w/0L/qPgs9ztfMBEdlLCUyjWmJS7CYowGaN7tEDEClY2K9DEZMDm2CpXHRw+IJgOtAzKC
	 Vcm+sif1sZqSrHC2DocY1OXBzveVPGTUgdLvLdLJVohhAK3QvsS9R4DF8CuqE49VmC9D9
	 rqtxLW2a3VssKyblovHxanliPaiyI41CPS4PU7YqXzceH9F+XrAyYBq0jVI6TbnJFZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kl3hjtqH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMgwdH3o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429CF606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429CF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kl3hjtqH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMgwdH3o
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auAW2255188
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=; b=Kl3hjtqHrbNM6nOj
	xuJncX+4ETr1rcO1gtaxpuptG70g6UsCA5K/Ynn7toA8YQqwLAy/rYiM47629XK5
	FrxT9GKcl4jIDO3QYrJjHf0rmW7/TBkxY8LNm27cc/2M+kLf9xUaMPfpZCKaksQ8
	kTGZOmq+fzP3GAf+oxwvMKa3fk4Iz2b83SLTGaxF/IgvbsijG8Pkz3eMB6OdnTfF
	BWFoH18dsmGDfLW6vSgthw1Cqs0lIw2PJ5Dgnr4AokMjLycCaSVw/rBAxdWIF8dt
	pp++/eEl7NDUU9zanBQvzCzqu4fe6xQ59iD9j83N7ZiGe6b9kjdz2eCctfkNST90
	iKJsPw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3n1cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd63a7cdfb3so1678052a12.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995871; x=1793600671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
        b=gMgwdH3ocogguiUrgPPXzqInvr+zk7ye7ZJtSetB+sxMAxm2VtVRKrO+Da3gwo64+N
         PjCjTkIGBmDcmLaGK/FUI14diip+KXo1/mSgeHVhm9qwr1lpzwMgYKqLyTor2ElBBS84
         mMXiGJgz9Rtu0VyoAvnWV4lvE01b/sQEUDp2xL+KDyBJGksIa5LsL7TY2XWMnkyc/dve
         ofwbOcrys0G99P/zB8hQ/Bo6Hn7UD8DFOtSiUPdD/i35Y6XTn0YzRPZO1bGqhR2kZIZJ
         nlilGJDlKC6mF3IWvCpbIb4GM/SEN79fVCJCsCj21pp1msV0/iIvCGpXPtLKebTn4PSD
         znEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995871; x=1793600671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
        b=Yl1SykXcAb3sBiFyGjX3xfSp++EBIOjPbAqCXRGMPw9EWt6w1CSE7y6AUItfu2o0Uz
         VLv0JXYTle4oq9jwg3RopluxZ599BVLgkc+uh7jjD1YJ1VU9117ILrY6ffu18veJD16z
         ThUdmoUkntY39Dz5gpnGneBhrC5q0K95d5+k8zxKIvsSq8d7QVVC368jpemRw0HZRUgn
         UWLvCPyZKtXK1cH6b3wyB1kbX6aeFgfqqUGQmr6agblIq+OsThWbvWAO2aOQeor5yfnz
         gyeHlknQXuTEnVFbVTRAmA6K5/PtDU+A9UHxuT1sp5jD2LCcYxiI8mZ1s9GpMVXhfacL
         fpuw==
X-Forwarded-Encrypted: i=1; AKwUvBzAG625f0xL4g9WN1qj0Nj25rzZ7+6Txc5dKAoqSrAyB8FYT3y3u7NbiUWfErg7r3a6p2fQstDJFjEq@vger.kernel.org
X-Gm-Message-State: AFq9FYLbvu5vAWJUdUV4nuHHd6zryl0YqaryjOuBBpNHElbto+Qn0OYO
	vkME0Dk4lbuKKmuPBdyYfQFCVgNIGMLK7s/D2FMIdgDCz5iCqUWjwUJ8Kzs9/QXftZEJBTaUdNj
	YqMN+wYIyxL4I9nuwXzJceSjq06EZ7Q5+Md2yKRSfFFkpdOXsx10LApQVaviPqYrA
X-Gm-Gg: AYBFou32IN+NVMnj8qyGgqJsfWGB4fXLRB9BBd+Kr/WAAtIN7PY9X1QXlB2tb6vNK31
	2EoXpgmSauK6KKumxJmSQ1tqeOVPvV/b4FSGIZY0HlTmHhADtfaxV2FBZhbQxY4tU0cCgUMb4wF
	AeYiRzktElMjZpHplbHcX6bquXxfJxTTwqnnAoXJF0N4OeN4TUGkaJOXw7QbtHU7XR0FrwRQ/IO
	5IIEO+XCnZZ4vjzOHqOJTucawqTKd0dILl1HDseMk1tkTileSM0SLlIOydbYzXP7G0ncTwbdr4O
	qWaelkvxSw5yi/OmS3cKSY8ycfXYmVwAu8ppqshxBUIzIJklew3UND0lrc8rF5nHhveFg6oWJDb
	YRSCg/EOa0M3w0knGZhRwagymwi0xYZC9EA==
X-Received: by 2002:a17:903:3c30:b0:2e9:821a:5527 with SMTP id d9443c01a7336-2ea9c6c73a1mr46780385ad.12.1792995870988;
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
X-Received: by 2002:a17:903:3c30:b0:2e9:821a:5527 with SMTP id d9443c01a7336-2ea9c6c73a1mr46780015ad.12.1792995870524;
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:26 +0530
Subject: [PATCH v2 16/23] drm/msm/dcp: Integrate the DSI bridge with KMS
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-16-7cf014efdee1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=4407;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=YkElIL2VP9q3UDs86ECzwDFEF/OyzmGpxHXTXDTkMBY=;
 b=dK6ojiOmJgJpI/PfAGPWySwWrv1PqCpsjGAfv4a+OAjHAZ2np/K6tzX6Lr5Vz7Q11ykgxlBBr
 N1hOZCgwbYoDaTZ7PMa47CbVwaPr/4ZRRrA8jHmArpW87PZxJe5Cdu/
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: WtPCEKKz6rx20u1eBxXndwagn3NUZRDI
X-Proofpoint-ORIG-GUID: WtPCEKKz6rx20u1eBxXndwagn3NUZRDI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX+TNxZo7J+2S6
 uWYdic/3vHMIFvreQnJnt3Mjl8bE7zp2ATxYt/qF/5AbeUAvenXqehUALDdEfxWyUoZss3tSRuf
 0nQSW+vHaE/RVXJF6ImnLuWnbXX+r8E=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adef21f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vhVORTM7vdiWvPRSmu0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX3MVN6ct96I3H
 vu0Y4mdbFv+knb/zGym1cKciyySsIh6qcaYb12OjoxBLb77ldiUDNwpN6KY3jsojPiU9SAVuJvM
 wAF7VaGHv/7x0oFsn4RQi1fdgVcGWGCglGcpQj40pZ5u2Sb+e0PuHARGwWgfvV5tVVke8C/55AY
 qsHjNQSaUtL3AHoGyMElb4fCLYBVXEuFpv9fXcUm+pdXxAo7XR8crdwRIrKbNXl670TvIQPWg9y
 8NBxbrNnhV/a9AgM1mUKl13TMlNVu/Qp1Z3IxyLXI9xBmKGilo+DWHA9cm+Nd5zszgs5znUY4sS
 uK5Oc1dl8aAgH4lZW7P6f5cWefmSPnf3Rp9t5f0wnuMfQNOTcbdzSq7smWYDJG14OHn1NHb5H7t
 ArQZMfDFA1pp2bHp/WIzOGunZaIeZjvXxD0TE0bHeVok9n6iqIzODPJ0TjnS/UbHRoJjPkqkukf
 kJhG2Pnfit0LSPkUmsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Connect the DCP DSI host and panel bridge to the DCP KMS
pipeline. Without bridge integration, DRM cannot create display
sessions, attach connectors, or run the bridge enable and disable
sequence for atomic commits.

Set up and tear down the bridge and CRTC relationship, pass panel
configuration through KMS, and connect bridge-backed display operations
to the DCP HFI commands.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_crtc.c    | 14 ++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c | 40 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h |  2 ++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_crtc.c b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
index ec4f74c2920f..173a07df71c5 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_crtc.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
@@ -147,6 +147,12 @@ static void dcp_crtc_atomic_begin(struct drm_crtc *crtc,
 		return;
 	}
 
+	ret = dcp_dpu_kms_prepare_crtc_session(dcp_kms, crtc);
+	if (ret) {
+		cstate->hfi_error = ret;
+		return;
+	}
+
 	if (!dcp_crtc_get_session(crtc, &session_id)) {
 		cstate->hfi_error = -ENODEV;
 		return;
@@ -559,6 +565,7 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	const struct drm_plane_state *pstate;
 	u32 max_width, max_height;
 	u32 mixer_count;
+	bool needs_dirtyfb;
 	int num_planes = 0;
 	int ret;
 
@@ -569,6 +576,8 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	if (!crtc_state->enable || !crtc_state->active)
 		return 0;
 
+	needs_dirtyfb = dcp_dpu_kms_needs_dirtyfb(dcp_kms, crtc);
+
 	mixer_count = cstate->topology_mixer_count;
 	if (mixer_count < 1 || mixer_count > DCP_MAX_MIXERS) {
 		drm_err(crtc->dev,
@@ -598,8 +607,13 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 
 	/* Limit visible planes to the firmware blend-stage count. */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+		struct dcp_plane_state *dcp_pstate;
+
 		if (!pstate || !pstate->visible)
 			continue;
+
+		dcp_pstate = to_dcp_plane_state((struct drm_plane_state *)pstate);
+		dcp_pstate->needs_dirtyfb = needs_dirtyfb;
 		num_planes++;
 	}
 
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
index 44b1c2200aee..61a4d8565359 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
@@ -7,6 +7,27 @@
 #include <drm/drm_crtc.h>
 
 #include "dcp_dpu_kms.h"
+#include "dcp_dsi_bridge.h"
+
+int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
+				     struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge)
+			continue;
+		if (dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return dcp_dsi_bridge_prepare_session(bridge,
+						      &crtc->state->adjusted_mode);
+	}
+
+	return -ENODEV;
+}
 
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id)
@@ -19,3 +40,22 @@ struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 
 	return NULL;
 }
+
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge ||
+		    dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return bridge->dsi_device &&
+			!(bridge->dsi_device->mode_flags & MIPI_DSI_MODE_VIDEO);
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
index f8010fc5d32f..333567a78ad7 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
@@ -44,6 +44,8 @@ struct dcp_dpu_kms {
 #define to_dcp_dpu_kms(x) container_of(x, struct dcp_dpu_kms, base)
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id);
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc);
 int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
 				     struct drm_crtc *crtc);
 

-- 
2.43.0

