Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638156;
	b=VHd9jCdqiyGiBSB27ce+ZVoFckRd7iiy4qd20+uOmqIocWpgxZ2wzvdV5dTNXYdXB03u
	 Ctro4ubh6rH86L5XpP4tY4WHgELO9Ola2r1esP7bQ8Ih5gtxkLJBITaWYZumNuGp6povN
	 oX7lvPRM34zV71R5/E9igjzjiz/ztU+/GrkgIiYjNYjdbH8ZF1UUY8RdT+0C8XOY6iL5r
	 N9Lufo8ozzhq73ys6vNMJXcjcDBf+7lh0VusXGsGlII5rX6F/Okzh0ZDjq7N/KfGQvLxq
	 KgDQpYEOxukjZ1YYW6wWfb4YTxtoso8qGoat6O53PQXjfSZBs9WaTI1LZ4nlBSXowzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638156;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ipPQ25tiHkUanST2JzunfB//g2qXyMbHVdRkURBDgGY=;
	b=xg+dhdbtliW95ItjSUwCDnyjVebrnSefbc/RAdPhnfVwAMZ3nE62MZ9wadmNCzGaOMo7
	 Z8kMC2/40Y4Gkml4Bdsaq81LQdEu59GKsrP68JjUhPzSdXS5u6cibNeEFJDJ+II6iX4jQ
	 k1u4ETqLPHZCvsdAwyfg9sh2bEVBFv0RLsTRQ2E0y2NracpUCEFu1EIE4HOlCd4XW04MC
	 pEzUxkD+hsY5Kp2XBf4ZcwMA416QCosPWOY1s4UZnWlHQmReSB54AqKdd0dmy0Rz2RZCT
	 GSuVKChL5gT1C0N8fL+W29c0u1qPTMRBfP5wlKtMWFVgyTMUbCrr7R+xovuxZPEejUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFF3606A33E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFF3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b502b9b702so73018107b3.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638156; x=1796242956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipPQ25tiHkUanST2JzunfB//g2qXyMbHVdRkURBDgGY=;
        b=MH/C2AYZT4M4RKBffqL+t5U68VBS//YOSW6ezIVHknN+bdTIsQ1gULOGIcCORnEa3v
         196ERcVe8MC4e9BFtDNR5mwERRi97844D/bCJ3a0DZEzKxSBv5258vwZ7q8DOFJaSZbC
         BeBm+k6YW+aMErlBc0n9LDU7GkYSNgNu92fI+2fTRvDQ68wN952zkqBpyU/0X52ipz7D
         4TA8RPaOavKYyBxZM1R0A7eYxFrCSnfRSlaJitjuuP9dYe8/k8JO7zV3RQgJjTmnyhxg
         95BSHnZcAxPU8fKKf+GqhcnN8OUWiSo5ESUmu24GNBYgqkbumdfC0N3nvkLUFVbEP9Rv
         pqJg==
X-Forwarded-Encrypted: i=1; AL+hErFF5rTd/cxweDYCNwzN8YpxVn+/rtkPfY/FF0/2Mue4lbSItF5i468Q6gfP4MzOweozwvoLPpqi7JaV@vger.kernel.org
X-Gm-Message-State: APuU4Z+rM24uMdwBlt7BlsHqADeWMU480aF4VzN8QfHNHLEqS8RbRGTN
	prV9JX/UQmkXof7fEMUTiygIv+c8keIkGIBt5PMQvORttawyssu0b/y2
X-Gm-Gg: AZFdTZc0By4ZkAHau3Zzx596UpgELicWBJUrd+ktwP37ZHDm/6NhNL/e300UYIwdj9w
	tqj/4+43NQwnFmBWFF2G88GaWugnwrFv6tUWFNGuDEkorK4xddSSMYyBo2DSO64T/Db0uWFKhLC
	13MHId4oVqwf48StCI9Nmsv/xEYQlS8itfIg4+oruvgCmPVeJqPRFoXNWU+iDibKOz3YxRXK+Qf
	Q6dBZ6q2s2j4O5mZA4kqz0gqdAYCJLdDmUQ/UKI4RaLflcI/cF1PRZpsD/82VUOO41qdzRViXH0
	NJNIa9ls5bs4+fuvJU8jolSxK7hs/FuejZaMLV3F6jWgwnHxYX4BOEp1x6S9EPIKVAVG01OZbxd
	SaMSFz0VMOaZbZ/EoclJGfVdPLdiLt23IKYm03st5KwwTNePZ9zdZoPNx1ZIv2Ltsk72ljKCoIQ
	3/D4dJknLgUUDB+39GC/CAjyzWCgoMvf6arACx65YACkeOXXlvGGun8D1ycA3vbJNmh5D98mFj2
	iiRE42ulZ+95JD+54c1fYXgAdWR2JNxzvqLLtYm8eDd+DY+w+Y5wru3uip09E0Yu2tXSfexdTYp
	EUAcHIiIcbTVFdRMLyeooWLTfgN+2wXd4csyZrmJVwFsjHEGQUZYVbVTMYo/VuIq/VVU8xDbBZU
	nQbeiWGsjawgTiJyfftg9tMre3nV26l3fRbhhUGGD3JAtS1MBsWEmMhpRR0dD0Pyr9NrHdfqrb2
	cFycqupDkOrZLTWnEn8qMN6NWz
X-Received: by 2002:a05:690c:338e:b0:8b4:cd96:e2f0 with SMTP id 00721157ae682-8b52031b32dmr59760337b3.6.1795638155700;
        Wed, 25 Nov 2026 12:22:35 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:35 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:29 -0500
Subject: [PATCH v2 2/6] iio: potentiometer: mcp4018: Report the available
 wiper positions
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
Message-Id: <20261125-iio-ad5246-v2-2-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Implement read_avail for the raw value, as ds1803, mcp4531, tpl0102 and
x9250 already do. User space then sees out_resistance0_raw_available,
and an in-kernel consumer can learn the wiper range with
iio_read_max_channel_raw() instead of hardcoding it.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index b10b4b920dc0..d6387645853d 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -12,6 +12,8 @@
  * mcp4019	1	128		5, 10, 50, 100
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/iio/iio.h>
@@ -49,9 +51,12 @@ static const struct iio_chan_spec mcp4018_channel = {
 	.output = 1,
 	.channel = 0,
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_separate_available = BIT(IIO_CHAN_INFO_RAW),
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 };
 
+static const int mcp4018_wiper_avail[] = { 0, 1, MCP4018_WIPER_MAX };
+
 static int mcp4018_read_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
 			    int *val, int *val2, long mask)
@@ -93,9 +98,26 @@ static int mcp4018_write_raw(struct iio_dev *indio_dev,
 	return i2c_smbus_write_byte(data->client, val);
 }
 
+static int mcp4018_read_avail(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      const int **vals, int *type, int *length,
+			      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		*vals = mcp4018_wiper_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(mcp4018_wiper_avail);
+		return IIO_AVAIL_RANGE;
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct iio_info mcp4018_info = {
 	.read_raw = mcp4018_read_raw,
 	.write_raw = mcp4018_write_raw,
+	.read_avail = mcp4018_read_avail,
 };
 
 #define MCP4018_ID_TABLE(_name, cfg) {				\

-- 
Git-155)

