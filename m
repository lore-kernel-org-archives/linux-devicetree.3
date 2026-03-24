Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAA237B010
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317714; cv=none; b=NgkFmDLUpUMejOYd3C1olptx6HZAmF+LLd2XRGRyI10OdtUcowWdEH7ffFEmJlV2XxE/6q9SvFFjxtrBkglEDhFWXquq2LncO/cJp7X20HgjpMw0nzSKj2s3qxZ5len7stBlaXf+4A8514sFv0c7gnVB+6Fad1VVCVxo4s3d0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317714; c=relaxed/simple;
	bh=CAjUME/AsJT8A/Pl3H28E0ZFy9j0BTNKFTGVCJ4aUUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZVhw7t6Kdhstyas1ZdAgQfcyiRpyLHMF6epcXZN5sKyOUs/oUxafB1r618tzN4URjM87V3EyrdJ8T9yuFAKyiYqbs6MJHSgl58ci+trxCbbivVIINnM1+kZZeCtXqNKh355jlq0SH7PCExxXa1Nl4Bx8peBgfPxPNzAzPIGrkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BynvMmd/; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BynvMmd/"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506bcb23a78so37175371cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317713; x=1774922513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=BynvMmd/dQ+cfj3+zMWSKYu0asdZh2MHEH48sKdOWgR6/5+aNOrJcBfktuAhMTPV5w
         6gvIZPltLALTZSmV4XLJDrpKfmPNF93ZuPNRoJcWurY6aTzH4tGT5vfZ3eJ5kMR5kkT3
         +GrbojcDD2V02dqIL3OUyIxEXncdVZUukeXwpLO9ONaS6WpmlK7zw1NmbeOt4ElAyQ4L
         QArxbbo6G0dyw0z58D60mlEN3gVTHo7ubOFPn79Kbq+POW3vbSDbIiQXP7mzVKMuzfZW
         CJA0S8DGFbQomkdkoyOAmywwHHgVFwo/YlkgqoGBDylNnkPTVcnXnnN7ibixY/6/QRp0
         uvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317713; x=1774922513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=Zy4AtZ1e0JZhQR2uS0POQwExoSe7QzAoELHHz4pQm8s7JDa+I5AFtD4eH3j2qQsHQB
         4qQ0THM0Mmy/i9Wcpl8MFGhWBil5W8YHsBysOO8ol2XDZu/guNoIc8x8RO2SBw/qIjZ6
         wf5fhL+ACvVL6OE7cueeAui2CnBoAH7PiUheguke5Q4EsaZimyYjbMwSxpECUzdiREUc
         4kixPTfBBgay+gQId6l5SD5LyMSUWs3llhjOAQOE+VhCyd1VcPoBwDNLK9JgHgA15bp9
         m5jivZ6hEIK49wujcTGkxPZSb+FfN+ekRMx5jM1moWzHyaNszG4MLL5kDm46/67J3Tit
         NQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4wK7+u/3PJgEdokvx9LKWl7XDPj8OAZkkoAJVz12L9tpMYuiFqNad2MopfizmBVzcO6vufQMsfwsm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7taM6f0E1Qvzoxm5xFE6s6icXXQ1hQ1hnM07+YsdeGdxhAfJG
	ipBpDwiTpw+phQcpsLA86ZOjDFvWc+YvaRJsoE8D2TpYQMG1terZg2+b
X-Gm-Gg: ATEYQzwn/qDpAso/cvZJDNLwiHAkuA7f4Zl661k02siux6yKyMSdU7fRW00cUEi0BQ4
	p7R+eSEs9hjfp577bvsKi9LWLjsYDcxEcpOaxhlhRrD7o3QLcLutGwJScOylGZh7p6qLxT9YJy2
	Q4VVb3fa6yorleTNscwerUxKrINaHfvOzxMggVpc8s8koWalotDK1R3m87Im/8hGoZQ5VAHaZtf
	reVKV0+c8zwQWjfaqUcmoFDoknTvC2zZhNpr664SU9rXtuq8ysf53WQRzKzlldb6TQ9wlO49s/v
	LvHvFuLL/iLWLhN7aCM3upqnRchYCkFbidssvm8ot5jxPJl4pKKC6L1FOSnZK07gb6xc+uKcwlb
	dVud+WO2fHPCI/07ANyx88BJkP6bmh4XKU/vmpBdaALtbeJu6cCZBhU+Oo/GZZ2s1IITcmGgNWt
	LqqEaFHygRsRTvArCzk3C0q438wA==
X-Received: by 2002:a05:622a:14cb:b0:509:d76:fe5f with SMTP id d75a77b69052e-50b373f5c94mr208736801cf.17.1774317712536;
        Mon, 23 Mar 2026 19:01:52 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e5b98bsm97534401cf.20.2026.03.23.19.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:51 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 5/7] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Mon, 23 Mar 2026 22:01:30 -0400
Message-ID: <20260324020132.8683-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since commit dcf6fb89e6f7 ("media: qcom:
camss: remove a check for unavailable CAMSS endpoint") was applied,
probing all endpoint nodes and requiring them to have a remote. There is
no sensible remote in the SoC devicetree because camera sensors are
board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 746e9deba526..fbd16b1f3455 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.53.0

