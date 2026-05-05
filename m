Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCED345CB2
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017560; cv=none; b=ZPNz03yrAHMaW60szmdaOopfAwHcJsSkEp0Y5xQHqaepknS9+jxCkjTX2d+wbFwJhLZ3VCaCtFosxnsFtWMupyKXiAMpLv8mUItgJOrPT6bjRbC3ysXRUkWuHbc7CJ5kqznFOppcTya+e6M+GCgZmhEQXo2ejp4Zzjy2UVtTi5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017560; c=relaxed/simple;
	bh=pQrsVHH672iLD541aAxk9aTkvN0tzWS/UIaQ6RTMYnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFsYEiYBdjIX66mht6ZfdCTGyJTgZ6ENY4tyTSTSEH6hoh05MI9rqBE9rNKVusUG8RIrwhlpHTeU0eUAr2FSARPoSfH4UkYkCX0joaOwAf+F9wd+rEUhkfEOmHaG2vc8hR9ylCaTzgYqA/wo50YqLARz0Wgs4IJoim/j9bFuoFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/8bZiad; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/8bZiad"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bdc947aaa3so12284387b3.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017556; x=1778622356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUx1WhuNP3C6tZPswT5NmzfLUccyj6ApWGSEx9tbsXg=;
        b=r/8bZiaddbTCVO5mZsPmxNDluuUS04jkjsiG3771ZtNXkv0PzpQCFcuQezWfFYVstw
         8I5Bat99gkAUUP9TBG7QatQ1IbottnW7/2+cmlq0cPSiNH9fd4Da4ab4QgPW7eWZZ5c9
         rwYGZjYZcngUR1eap9GeDZPt1kH4H4MbMRl1RL+8gAfh4bAMRWkPkY5w6wA4GHD/cfWb
         KjE8f+L4waHYO5mIQ0yq1n7JfESHG/pJLHLWnyaa6l7UwRREKav+aMK19e04Tc1mr+lg
         Cin6qxG3Aq0GiN31ZV1URgoZFSqWI3lM6cNtI7xCJahLKkTP+aJHVEjoLtFl6bE+zGUa
         NR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017556; x=1778622356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUx1WhuNP3C6tZPswT5NmzfLUccyj6ApWGSEx9tbsXg=;
        b=BhWwA7zD6pQHhfbkybBD3adCcovK7s93wg23+QZBPA9I3nBjko0Z+IOECNq/5FGNG8
         ML8H6dlIoTr4q+cI3N/SVpP8z+y0kOEEfjPV66H4E8wFrh4vHxZmWEERdjd9cYJYhNT/
         +ShkBW/pzLFCkOBo3d8EnOKYrF9oxnxrMqHlQ8iA5rZKoB48z6vZNMdpRUQdWcW/uZPz
         XGwWfgGJkkAp7YuKk7eN0VMI/LS0ZU2pfShHrV84W8phf0jy9JjUWmByWm/6SG0PSSsG
         CGjSA5zE3e2kpsDtWFmcRNxY/NpOsXShYTBYTqeFI/LBkSK0BZ4SvKax32QyP9zyG2jd
         LBSg==
X-Forwarded-Encrypted: i=1; AFNElJ+Q2+0Og7zVmpCfCyNMsc4+IiTeZGUQnQuxvPHje4Sl9/Xy+xHR/8SKoJC+6LhyONczwhDNsAEQtfnS@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYiU+7U0OLQK3YgYCbi0o/LkSdmc1cIuZvG4jIVWfnoJgXNf9
	cFg6IN0zAHmCBYxXI4ig/j1x7SqHRUwXU6TGNOJlJQuH/Tx58mxIwa+L
X-Gm-Gg: AeBDiev2o06R9Uqbh9Kxtdg356Iy9agJ7IiBvWTYjO3fsnVxXW07s40D5x52SL5sBnv
	AxN3hu620+jMdnWK5Mk8hZ2u0sJZ2jL9cgVAIjbd3gt63p3guKN/PGVaOjyLk2cYWr/fYspTeLT
	cwZveJvCaF6tzZ5ONqNgF7xvCyQfFgefrucBlqt2dU2TibIFvfZfzt+g6jqWZAG2HSvQ02uS2MU
	fm/ofBN0vetqmWM3mUbkkj9nzwn9SV6kdigKS4mEUQYzDByfZ+9cu663ppcZBhpIEmygRSUv2RX
	ikTNk+qJxEAiJbcjtuW28QUFGVF1lhRAJ3jehIvBSrcn/wTtkK7b5ol96LCgkhzO0zw5nUUTHLD
	qXGC2ra4c9GzvrDC0zx6tJ3FFscaqmSYEmxmIwL0KaxWz5zZa1JR55Wsw8Lmt6hjhTcgmUWzpj5
	UJwe5ujoDA8GS3AbSiNSiaulu0gfQlx/nPj8zx
X-Received: by 2002:a05:690c:14:b0:7b6:f4f:f06a with SMTP id 00721157ae682-7bdf5d8bbf9mr12969057b3.6.1778017556354;
        Tue, 05 May 2026 14:45:56 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:45:55 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:39 +0300
Subject: [PATCH v4 2/9] media: qcom: venus: add common clocks used by both
 vdec and venc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-2-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add clocks which are enabled during both decode and encode. This shall
be used in newer bindings for Venus, where subnodes for video decoder
and video encoder are not included and clocks are not differentiated
between decode and encode.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c1d772c7ae9b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -77,6 +77,7 @@ struct venus_resources {
 	const struct hfi_ubwc_config *ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
+	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
@@ -140,6 +141,7 @@ struct venus_format {
  * @aon_base:	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
+ * @vcodec_clks: an array of vcodec0 struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
@@ -194,6 +196,7 @@ struct venus_core {
 	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
+	struct clk *vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;

-- 
2.54.0

