Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513608;
	b=IEKRK7+OO9NYMqDOiUPT3BFY9sGLJ6oQMszkEb7rC9DDu9TJ3lmeeCsOYRmsYmqpObf7
	 GGEz2CC4v/Cr2hRBSnZZI8sQ+pjldVIykObg+sqfRP1e3AbCkVGWhBYTsb3khZajphjVJ
	 1eVUO55znzPE97VCNZRYngi8xh8wfnxnhxULLYn+Ev0NYl1uYTn9yb2A34UQN2dAhrBCh
	 Iwu2mVoSNuG/yd6Pf4Cuy/e05V9SZRaE9+kEnILeSMWNPZwS8HyojBAD8Gan/Ie+ZRtZa
	 NVa5qFtNJh0I30b+RohqnsGRD94BnrpQSR3xIh7qX2zd/luYFFCy17CSsFJqKUmyXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bC/+9T2U8Kzer0tWSeR+xsoPj4sAgxGYU2Of5ey/6oA=;
	b=HJx5y6ea9ck/zK/4nswAvfq1TrfHgSZST08Tb7G9AGlfLG0ZSjjQGfYfEgx/YeE8qggN
	 IixV+ZERKMxThh+f72bs987TTl5OnLlRZZu/Rpmjq/v5CTcT9xoCblacxed8MPLmKf2zB
	 IO0B+qsXO38UVVuz+/ziOi38W7m9ef86eXWpQByczoKWMLdyNAlez1nv0SxZpo9YwWyZK
	 4z1/IrP5DfS6CER6agssn88e+wLsDsbQmK4aYsa2JEEoOiyyUQvmVceBpkgBHmlDlVPev
	 ZupbxIYujqBJaGJFYQLvbWc0eunJFRbAgK/3X2TMYc6i5iFfp0m+c+D9i2tm95zt8hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qHVlQaGJ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A450960777FE
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A450960777FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qHVlQaGJ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so19510675e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513598; x=1796118398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC/+9T2U8Kzer0tWSeR+xsoPj4sAgxGYU2Of5ey/6oA=;
        b=qHVlQaGJfwcvc0wtiqE3FnLP7VpreHf8WPdB5ZLJoIs9T8hcIqcJdrpjXKrixXC8jd
         cUxw5UenDWPVhF3N4eMGqucQQWaqjZy2Pr6wyFpAmnV9PMIDqgDQ6hQjb/0r4g8qZe+O
         0Vq1q8DE8dWWB6LSLu6IRrjB6QuZgzQ2ZYIiMqgIDhN+JPsgRd7V1MebF8UeY4caQcx2
         X5uy8EC18TEfSe4jbJj35sR0uoPK6hzLdx6GBQyFdIlWQ2afLwpcO7hJdVML+IgCl/c1
         YtfOvcA8CK9XIMmHHdTCoUYjjKkaFedhOGL//+zGuDGFu8fwXad9tQ9XBU5/uX4LdSAZ
         ndOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513598; x=1796118398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC/+9T2U8Kzer0tWSeR+xsoPj4sAgxGYU2Of5ey/6oA=;
        b=zv3xn6oETtaH2OKX6ICH68Z/qGhUHiqoko4IHFxmGg4tyh1rlAAqOQhTTz9Vtg/7O6
         kNvtSUzCQBILOfYGv/UVm0a3tbQ58L7OJq492sBjMxXIcjDuD4PXZpbHM2t2FhLMNNpw
         MbgZ7nqkoiZY8UoofGFmvP3lm/Dys4ZTPHBZV154+srW1/eEbnztjnfsGqreTr+4RoA4
         aaPGbh5xhDSUcfPEJYWSayyfeemN0F2K+uQTsGqYg9LVSN8WXpSVeBzSzdLSKoJ/ADtr
         CqO9xyKgDzQm1df6NjjJLymKKkPoFpYL3qAaHcCJKxjqY1ysxfBWYgzTvvUFLoWXeRoK
         xdFQ==
X-Forwarded-Encrypted: i=1; AL+hErGcficsgitsTsBiCp7eglOG7RgM1KUf16Y2ixjGOzFnqMCVAaaLxD0DJDxMgEZLVoCW4g6+H6ow4ZMp@vger.kernel.org
X-Gm-Message-State: APuU4Z+ffrnVltYxgWRk4k9G11vaS+brMhiAQQKQmBmG893kbUTLG2EG
	ZMgpjogx8IZsHLHEc565Ayxmap1oHUdDQPsDDQHqjNqcFRNtuesMSg1lf0ds/v98IbE=
X-Gm-Gg: AZFdTZdvkvXA/KbSFtuN98FtGrtRVpHlT4A64wCZWmN3J6VlmsFCpHu5EeZI6MA27/U
	dl2bRWb4IDCN3D9KuGyoy5SxFCbVUlrvurInDcM9l1b/UC8xW5dAZhqsqBP1paWhZ4ewbL/MHQL
	yJgngqA5Hf72eM/W8exxMRcqQW0eZtw9mJ9uZHCxEjV6MO9CqFTPyS1hCWQ2ZSaGZWAEWwOft3Q
	O19+Kpd2bPEMQ049FXgahDQPnLRuuUT2WibdpLUsoNVhN/LOLBovW2NCkFP+douyCva3LxEZ3An
	ZITS07hvO2ODQMgcuveMERCr7Vwq/Iy96eHaCv/yAqY9SgEV8rWKqfF1Eg/XZ8MMM0ylDHUQoO6
	MOaVN5mNoWHqytFbn7IJp7AZVC/PzbZCkgcyXn7zI+QHYh0ouXuADWmOsDBvUhKisPFTcAXrumn
	vIvBb+xIcbM0GFhHbcrJFVCbafJF+PEgDuSoIaa6dwFbcsgulHvken2SHrGgtDWk00oSJKy7kOq
	AgYCmhD4v6tWZ0zrQMTqMUhjkMtTG88JKGZYn6EvlekGTkAh7gM24tOQY1l+k8XreDD443kcjJo
	4DATPUHBFqIb+90O18lfgwYGApG4OLXk1hLg2X9iGxjx19VISuOjt0K+0g/S6Gn1SYs7HEtaWoQ
	tEzIh/DOo8lA=
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb88824b18mr290530295e9.33.1795513598176;
        Tue, 24 Nov 2026 01:46:38 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:37 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 4/4] iio: magnetometer: mmc5633: Add mount matrix support
Date: Tue, 24 Nov 2026 10:46:32 +0100
Message-ID: <20261124094632.8879-5-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read the mount matrix from the firmware and expose it, so that user
space can account for how the sensor is oriented on the board.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 08bebc8eb5f6..a25d989afb2b 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -95,6 +95,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -104,6 +105,20 @@ static int mmc5633_samp_freq[][2] = {
 	{ 6, 600000 },
 };
 
+static const struct iio_mount_matrix *
+mmc5633_get_mount_matrix(const struct iio_dev *indio_dev,
+			 const struct iio_chan_spec *chan)
+{
+	struct mmc5633_data *data = iio_priv(indio_dev);
+
+	return &data->orientation;
+}
+
+static const struct iio_chan_spec_ext_info mmc5633_ext_info[] = {
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, mmc5633_get_mount_matrix),
+	{ }
+};
+
 #define MMC5633_CHANNEL(_axis) { \
 	.type = IIO_MAGN, \
 	.modified = 1, \
@@ -112,6 +127,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -488,6 +504,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
 	fsleep(MMC5633_POWER_ON_US);
 
+	ret = iio_read_mount_matrix(dev, &data->orientation);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read mount matrix\n");
+
 	indio_dev->info = &mmc5633_info;
 	indio_dev->name = name;
 	indio_dev->channels = mmc5633_channels;
-- 
2.45.2

