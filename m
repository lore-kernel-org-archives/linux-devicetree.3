Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777981;
	b=lcq7cIkvIROda/1BPwx0ClQfLhW6lj9DmGhi/KWJFzYFBrJLMeWtH2iczGln2Fo98SJ6
	 mJcJwnJH9ybGKU5YY0mjROqtvSzdJcE4nwqXa+mDGBYYFlocC60MaPq7i0S3egvA2M/mP
	 scXtuaQeSvOB/vML0cc35aAsxzEgMyix75HlZHclAa1fyQRFu5ylit7fgW1BRsnqEOvUg
	 y4LltM4E88UZLgpMc4rRyrqUnHHye/MqBLwrJ9Lsy2htX2ldNNCvDsc9dNbvocoVjNC0I
	 3kIGwfHgB0w2BeNhgw4C6LVuJI+tZhFL12kjDXbV0Ns5iA0d+bezKnq4y/OKTM399qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777981;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KCNW0A2eLtsZJTW28kFA+jvGmbYpUN66AAzDwzgAjdc=;
	b=Be9VqdaJUc20rGbN6kluNjPG0OS9CLXNh6sjm9I0QMmwmxSeBscfmwnDCbAVPbaoY/0a
	 1Jpp19i0SPtj9KVtlMXCe/mTsNEsRS52Po9jxyF0qSqb3m0ouP+vochGsFPtRs+wQXSlC
	 Qc7emZ32x6CcuAyZCWh/gwHXO3z8be68s2CTE7hJT2UA35J5Zbua+8ki2LhrBk4vNnAWg
	 FL6vVOBOJzCoHf1WDyekEb0fsx6/ULDy+TeeMeUn+5QsK16Bjyr/29iVbHYR5+A9LUSKU
	 vQ3+URIoEk8hYN/AaECesYVCj47NqrIcppcsoHTP1onVPOrLQgt7XmwhniSP+mL0NKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLVPuZMg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0399B606A31C;
	Fri, 27 Nov 2026 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLVPuZMg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAE91F00893;
	Fri, 27 Nov 2026 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777980;
	bh=KCNW0A2eLtsZJTW28kFA+jvGmbYpUN66AAzDwzgAjdc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PLVPuZMg7tJVBF/D3DWrg4KHoPhVJkQ63P3WTADZ6ET88pGeGEkX7oj0a/MPfWZPf
	 xPe7+CXrt9D9/VuZ+Y3xORs0Fi5Oyfn645q2D3Y1ZbfXK8CaL3vfCJCBfnzvHM7etN
	 G/XEIQp9ryhlNxVmLqiD43SGtqZYSb5lTmi6W5XQh50l2OBiQsZbreKDYr2RcWHZEZ
	 dGEKZ8bq8m9opy8LDzRWRNyVxiXacKXgegCi7eml7OH6cPf/qgtYEM6FDwCpgDzqrl
	 1mZ7MZefJor3gPEOWGMAYP+60mBUH4jwTVb26DHtJVskz4mZdmmcRLeB+FaJPMVt9j
	 lXHAZ+m5Fp/bA==
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
Subject: Re: [PATCH v3 09/11] phy: qcom: edp: Generalize power-on path for
 per-SoC overrides
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
In-Reply-To: <20261116-nord-drv-dt-v3-9-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-9-e3d3bf0e2c49@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:42:47 +0530
Message-Id: <179577796721.3421.2624975183019402159.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=mani@kernel.org;
 h=from:subject:message-id; bh=XdRjfs9vyNWIYRnMFCP5sRKg9fFa3IxHZ07qY5a3lXc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWWyJzVnFqVakHuL1+tEwJRcWfzpN5VDPNWtR
 8pu0fz/ri+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawllsgAKCRBVnxHm/pHO
 9fGiB/9fqFbg7HsMmFlTHqHeWJBhMB94jJelxQfeMG1DJwdOpTbpEic7YUer1jDKR+4/PTN+qNe
 SLd7KUGHj878lnSkRPFi3DuhMaBcAic1ILya17u/9RgbjVX+uH9GBaNep99Xp0yJJ734YBUFF+z
 Fi3w6mLdPrCAn1oA/z7QObZ/ITUkOLBnMakpizCnBJIjJCRbePOUYDEoDzZ7zUD1if9Nawh7D4m
 u9i/+waRSH/bNotlbnstaU8nkCALhseon4S2F+Cah8NvuA9Q+6xW10tS9xh5sB/IHQVI1B5VtmV
 tECh6jZTNtRZ2iA3HQhyIMAKbgNWGrG+lroE4GE/5xkQgzmu
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 18:46 +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add tx_res_config() and set_voltages() callbacks to phy_ver_ops so
> SoCs with different register layouts can override TX resistor
> calibration and TX drive-level writes independently.
> 
> Move the TX_BAND and RES_CODE/TX_EMP writes out of the common
> power-on path into qcom_edp_tx_res_config_default(), which is
> assigned to all existing SoC ops tables.  Likewise, dispatch
> set_voltages() through the ops pointer in qcom_edp_set_voltages()
> before falling back to the default TXn_TX_DRV_LVL writes.
> 
> Add phy_status_reg, tx2_tx3_lane_ctl and bias1_en_2lane fields to
> qcom_edp_phy_cfg so the power-on path reads register offsets and
> the 2-lane bias value from the per-SoC config rather than using
> hardcoded constants.  Populate these fields for all existing SoC
> configs with the current values, preserving existing behaviour.
> 
> No functional change for existing SoCs.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


