Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7594DF4BE
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786060; cv=none; b=IviE7CuafSZBgXFipHMjvHtcpCGArK+VCxx1/tQlULAqK9t751SdXnjLv4lSYB2I+Us6bmnd3BMHzM4uxtXLO7lTiYjSFQgpH18FpwN4MSEiDICvPdOlQEjKx8LUgEHm7vJ8NMPdZNqtAoyoLiZnoFAU9ToBG9l+Z7b0D4wbe8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786060; c=relaxed/simple;
	bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2/UKnm7ZMc6c63YeMAm2NIuQdgmtAE/jaKtKGN2v0qzBUU9Xdh4NdgvztL2olc9CBTC9j2Q4bVst1gz+EbFNJljLyYTUKGR/XwuHuTdU6cRChrFTVxNduQxzeReSCSEIc/QUkpgeRrunYPY5vKNs5s55DzMQupQpTmGkoYkkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0QyZFyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xabq7Gu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0QyZFyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xabq7Gu/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnR5r217666
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=; b=U0QyZFyb5KLlWYk8
	y8Ms9NBX7C+Phqwu8Ja23/VESvpzoMvk/JXsL3Oi8uNXNanZvrQBAURcGEln0dhU
	imAGiOxBvNb/EkQcgf5b+PafT+OV/fS4GjbzG0IU4k68ReQbByXmawJTIJrLP1z4
	op2+k7il8TCk4R7rQsUOd9W6EgH7GgtVk5DVcWIDMMBKBcxRjvtBXnlAOII/nzX9
	vaB3S3hSlWAYT+jCsuGDzB8cX6OKU+P+yR/5pv8Vz7yDHbx1Gr95znCsuiphDKEY
	8rW0xgGTs0K29ojscyIzxbq80hyJH701/z3VFhjolYhfdTSXUaEBdu/EStDorqvF
	/xHrNA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgvxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:00:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso402836137.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786047; x=1789390847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=Xabq7Gu/Tsg9c6CEsjt77iLNyjzW8YFHI3Q9oBLeTAc23mxZnxMLbkdJnbuY2/dXuz
         Z7/hKlR+vldvMdHq4zNY+NXuggozVArqLu2KVZKMEho8Q9Qh5Qol509nfFmDRmbR2A8U
         n8tw1LnKl+pWCec7tWc3TS9N1LPvjWV5m97489vq5Qpp/jVcXAG3fMEVB5WbgVEoOjxl
         bitcvTaZAjrqSPt/wwYeWjeFYb4dWNityHyjwby7Ze5JmWiictbMD7A9QLiqj+P31bN2
         Ea0WoVS/w4sPphH44AS1R+cUn3dYdq9pYkx5C4mojeVs9pEXIjrZw3MWZy5dNjcNuPoD
         R9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786047; x=1789390847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=EhAjSMU1hT1DxiBz3qqKff6IcxKy47f4CEVgP3Bd3P3+LLx7QE2H+znPK4pEty0FHo
         Gf/sNe9gruvdOXMTZ12upHXOxGZ8A6gYnGI38npccIB4cHvUzbmcY52Mv50p6cq1s2Db
         OvJjuNeDK4uB05y2ekyDtdUfbzs93pqYXd7FhNYFWmnITD/s7koSl/Zs4iQa0ZgAf0vk
         Nm6Dm81euL6P0m3qCrZnohEnK4lFdla18FeK2osF/nJI7Wk92EobatNhaqdPeANF13mJ
         Q3RPJijjVpuiGqNveTNLHkTowNjCnch/Bz1DFxYffDjek96301kjImuX+Un41FYsYofz
         /TfQ==
X-Forwarded-Encrypted: i=1; AKwUvByBN2qxK1JPEb2Jjd2acfZ3k9XryiQbje9pWHNlii8TMbymCzoItdurLJqNaDAYWRLyzx7owVR2buzg@vger.kernel.org
X-Gm-Message-State: AFuF++nPZUy2yQYgN53+dDky9AXQQnv5GxC8pBAcqWIqP2LnzPJ8PE2V
	sLL6lucXDmZ95BUiPLpnTIwua8wwqtYKVc+NhNxRyALWEy3PYybgguwkEwd+WaetF5+rX0OIPgs
	TPcp7gVgbnESsElEU+O8P1z9wUUrdVORaGvSAL+FLt9bQIuzKhsfAt7pWWcGBYN3b
X-Gm-Gg: AYBFou1eqJNEIzqGa7M0zUcbfWQ2F+xvIBcHeQV3bF/VeImTTrZHiLup+hln+kO8FG3
	o6PmxChuqKKHQVYEIrpD0aPymCGEHZwBnwX685+BBeBYTvo67TSMVoB63OnDmIRjv0Adc1QJo8F
	3rThJLovY+IrAO8I9WcnElUT+MokkzrN3dAB3z3VtqJl3V8+gOI9ifl91w9v+fSOoDcGEelzrlA
	Fi5OCYbrDnHpNAGwgSbB5wPvdjlej4T9333DRSW24XOXWLiPO1EUsg18Z23OpcyLQJakm6KgxhD
	A1rsKTi7FpPHcgW1E+j0OY3UwkcM5i/uZN6eYl0obIPpF7apBTIgvxq/yG4n43zD3gy8xIKNv+R
	Y/FuektUn2bZv+dgj8eBbScE=
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id ada2fe7eead31-78a4aa3506cmr6713741137.11.1788786046848;
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id ada2fe7eead31-78a4aa3506cmr6713717137.11.1788786046373;
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:20 +0200
Subject: [PATCH v2 6/7] drm/msm/dsi: Fix indentation of if block in
 dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-6-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVoYKlet5BEdF1OEjdeDKF+CC9/cDNCyhAqO
 C0NL1jHwCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61aAAKCRDBN2bmhouD
 14WZD/4rXDWg0PmMoA6VCJqIYCdWf2B2C385vSgk3FZWplp0SgmTcNpbmjOSPlHGniaeJhHigKY
 5eWv5VAbVWk0RbXURY7nWAjuiT5wQU1BD3TKph93/rCeSYv49y6wMgVF5/n6JgsnwFYsoQcCwCu
 cg4uhPP+nBBnCqS2U5p676DWciFeYK6VSt+CHjXqVbwSKOG03hMlOBOEstfnCMes62cVn0PNRjR
 hNwbWj2uxqiJ0IanXuzipepLUVCtTRkarlTYqknoHut5aWnA8rEKMyrtODemUluLfyO9o/v/Hlv
 CpkkImTeuXnquiiLF4Cifj6awb0uEhNFkCEY+JPEo+/IERu+HJkc9WkX53OhYAmXIWhAnjNZAaB
 UD1C/5I0xX7mNx1bTqgMGyQgO598ksl+yh9kVNPzPUzR8m+W4iemj3IUvonBxSNMPL8F1lCY3vs
 rq0JLcBWX5Be6azuvjAQxPCgthxCMmwBJdRdDemMHCG/gl9gN9R9TwffIZLxQzZaa+X42ZUfURU
 21Kl6OVsZ0fhWUuq85MJxerUaNApLgJ70HKbgGNupaTC8HR0O8eL6kW+60yAZ4Fjc+9YMf5A31G
 mL73oJ7JYyv3a4OwP7gZGFjiZERCRnFiGmDpNyANgLMTgg2ArbPMTjvCuOeipfZySPx+wkb+G2M
 S2sUfT62evsbUpw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX1p2+a0HWws2Z
 X9I3JrDNh8UAil8bmR5OQp6BCtfhL6sDEY7GRySdS/CGoKlWDt9pj4JhIuYwxJRF+6Lxe4mdktH
 C9r1YIJfQXTGHCUq534s67SymdWwEduuPnfZYapVZKIeCmtHdVb8iwKNM7KiYqXvONOGGwYxOxc
 RAVgD0D9skzeLIMIxktQ7Mr5VKXr5UyVws5faKKAgAolgOmn8JmOiuDO4s/QjWGSXtlN6gSLDTl
 GG+K0hHBbQ72vEOPiDMf2HtCKKVPzHaBgbM95kCao0yZ/JSt1JlAz4eRROWXIl76lnaE5scguxF
 OmYtSh5CWLyHNZZmr/voQU64IIrUlEYwtZQ9bZUjTqYxanxcsVKYPfNA1og/Qb3tg9rH5ISpJWG
 5bibvlKjYVySq6zD3+asOUwPaBWlp7dxNxOwoPxbC5Pnbglw62DEnkKT2FNdQp51netIR5W+ufc
 SDa2+tUB0tsI70LoIuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX9J6GYL4aV3IZ
 7jGj4b8bIzWtZ1eBRN4IlYdHYiCkGWz6YyGQJMjiUFVWL4Dtqe0eCc+83hCwgpM53LdX1nlbYVw
 Fin1ziqb3KDtYOPHHj/qzaFwfItN8b8=
X-Proofpoint-ORIG-GUID: n4yig8VY2MnYtxT8CrQo6--0lHJvguVf
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9eb57f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: n4yig8VY2MnYtxT8CrQo6--0lHJvguVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

Correct confusing indentation within else {} block in
dsi_mgr_bridge_mode_valid().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..531d4ff78f56 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -429,7 +429,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
 	} else {
-			return MODE_ERROR;
+		return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);

-- 
2.53.0

