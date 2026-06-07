Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BD8331A44
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 23:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875942; cv=none; b=iRovagLRXDgUhEfWJ4Ye3CJrtQM0LapbBkG0hAnLlLyXvNq02sm5Hr8/GKoWzsrMR5YH+HaUyf+PVHJ/Pccwl8QSH+aIVcwT8SSGwQEcP8O6JVUKPYq3rMBwxGQqu+edDqYsrT9bAi1n2oE0BsYJ3gJN7HnrvxToRJ36yjDdiYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875942; c=relaxed/simple;
	bh=2sVlunj/mZoHcoxd2cD4P4fdrzm4ewYqwvFCAz1C1iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrS0L1lL+ElgxkBte/u0euioCyv8TmT5QVvqOk+qo3FMUcDuMhBlzrGUpDl4lFb9x1ToKgOmNjJPF2BnvWGk3PzPJ1RGHQT4S7nVkKzD1NsoRloxNuII1iROmvSS75qzPXgXM+nj5MyiTqJxAXbPvS56zeAdkZZjHRLMOzjQ91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOEEziFM; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOEEziFM"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so1883852b3a.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875941; x=1781480741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3bgmmYaDea+Gj+ghcKiuju7bxxh1PhtZqeiDo8GA5Y=;
        b=cOEEziFMnPrWp1MARMwpw5TofC8CzKKDDPAhWuNp2MyCv1Aw4vPbofKX8WPKhQvTxk
         bCH6V0u+D7UsUXNNCOj19fGE3RGNoPdYjOrkVZbY/OYOo6Q2G7qYEe39zYb+sbiq1rRp
         UMOk+1G0JFUJyB3EqrMENM29RJJoQY/OlivF013dR194815DmJt3cWHNm6Z00WlqD98t
         YW7y/N2NpE8dUuqgO+aKOtuDzjgIRdBQC5BCSlRHlRDiFkkdj9XPYLCymaF+jdJq5HtU
         AOiSI23KpSi4FYlihzELLSs/Iv7ZdcO9t5qp/10TVKvfEEM7UujlWhQmdi8ecYvza2qS
         UuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875941; x=1781480741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3bgmmYaDea+Gj+ghcKiuju7bxxh1PhtZqeiDo8GA5Y=;
        b=Z58/LL2tRyzNkTfIccF5mUe1+cJ0MSJy5PLMa7wEkeD2tyeH6U4/OlgIziLLiwqXRh
         PIrqQdClsQh5yir03IguobougH9VO4SQ/M/1p+tS8ORuJ0kw/ZDkQmsIp3u2xKTZ5cRr
         GcQS/h1V8l4aWYsbIfby7rovEDI0DHzORFYFT7i1yxB56hUru6JO4oGM4fogsVF7T8li
         0BHCFZZa9tcwMEELTuv4JSnccCgjzyMBeIf4pqEkS8wLg2oWB4zGzKxB7OEXd+waq8jw
         8TaVoGnne6h6IIRlEXJXZ1VAG9xXrwcfwonB36/CIxUsCqlCdEMC8yaJ6auLi5XP087v
         TqCA==
X-Forwarded-Encrypted: i=1; AFNElJ+rYUw+2PlIVQjjVgiOAejvWvRA/h1hgdU3nSltgbiY+2Fe1S329AVR50TPvPDqq9G/4WgqgHN+R3gW@vger.kernel.org
X-Gm-Message-State: AOJu0YxSPSsWpmSoU3e01E73zzDe+UgifZWvsc5N7/UwLhO6gm/hmLXw
	3BOhqLUkSDDuA20ryfUAaS+akohUFeix/Yt2gzx2hhjN75bUIF1yKpgm
X-Gm-Gg: Acq92OFMqZ3B/QBpQTHA7+F49pOWdrc4C4f1UVvwm3XR12Cpss5EjFDt3Gdw+LHS4dh
	zvBG6ydxpq+GhLJ+6c29B4T0MaQcGyrvfKrANXyy7CGP2UVoeK3dSwDNyNvBfiY3+qAEe81J0VS
	zOkgJc+oNzbSJxfYeStGxfFsX7SYJp7nPPTNvt4Til94s91ya+4LkaxIzDJatcPuA4vju16Enmt
	n+kOeEZs1iieL0V6VtXhJiJevL2ZezAZ3DWKiyxFOx5fZxKTUL1s3b8C3Pi/xboF/CO9YSixpwf
	4h8qUq03iF7sdFf4WoQaaOYYtDgxD+vbej/cY1GaenZbln3iIcW8IO0D/PPwJ0M9FYFF4JUabLI
	Qu1h/FCE8to2m43Nbj1QbmtMPHLepri7orIVitEIfJp+vCIn7lv9c2E5mVaanxpWBivTDzuLet3
	fjafAIZMybLORTkFqmAdg2nANJIRUZDn7O4KjTB21g+cxSsZC888E+bhNJu1cKvOh0OXflar9SV
	sktpredM/eFmlEGqPZpTv5aBeR279hCw2m+Qnzbbi8m6mQR
X-Received: by 2002:a05:6a00:808a:b0:842:4982:82f with SMTP id d2e1a72fcca58-842b666f8d7mr8968903b3a.2.1780875940733;
        Sun, 07 Jun 2026 16:45:40 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:40 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 6/6] iio: osf: register IIO devices from capabilities
Date: Mon,  8 Jun 2026 08:43:43 +0900
Message-ID: <20260607234343.22109-7-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the IIO sample push path.

Drop the redundant temperature scan mask.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_core.c |  9 +++++----
 drivers/iio/opensensorfusion/osf_iio.c  | 15 +++------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opensensorfusion/osf_core.c
index e0a12de01..61ef55646 100644
--- a/drivers/iio/opensensorfusion/osf_core.c
+++ b/drivers/iio/opensensorfusion/osf_core.c
@@ -293,10 +293,11 @@ int osf_core_read_latest_sample(struct osf_device *osf, u16 sensor_type,
 		    latest->sensor_index != sensor_index)
 			continue;
 
-		if (latest->valid && channel < latest->channel_count) {
-			*value = latest->values[channel];
-			ret = 0;
-		}
+		if (!latest->valid || channel >= latest->channel_count)
+			break;
+
+		*value = latest->values[channel];
+		ret = 0;
 		break;
 	}
 	mutex_unlock(&osf->latest_lock);
diff --git a/drivers/iio/opensensorfusion/osf_iio.c b/drivers/iio/opensensorfusion/osf_iio.c
index 5e5099878..3da3f2bda 100644
--- a/drivers/iio/opensensorfusion/osf_iio.c
+++ b/drivers/iio/opensensorfusion/osf_iio.c
@@ -6,7 +6,6 @@
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/kfifo_buf.h>
-#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -89,10 +88,6 @@ static const unsigned long osf_3axis_available_scan_masks[] = {
 	0
 };
 
-static const unsigned long osf_temp_available_scan_masks[] = {
-	BIT(0),
-	0
-};
 
 static const struct osf_iio_sensor_spec osf_iio_sensor_specs[] = {
 	{
@@ -125,7 +120,6 @@ static const struct osf_iio_sensor_spec osf_iio_sensor_specs[] = {
 		.name = "osf-temp",
 		.channels = osf_temp_channels,
 		.num_channels = ARRAY_SIZE(osf_temp_channels),
-		.available_scan_masks = osf_temp_available_scan_masks,
 	},
 };
 
@@ -265,21 +259,18 @@ int osf_iio_push_sample(struct iio_dev *indio_dev, const s32 *values,
 			unsigned int channel_count)
 {
 	struct osf_iio_state *state = iio_priv(indio_dev);
-	s32 scan[OSF_MAX_SAMPLE_CHANNELS] = { };
 	s64 timestamp;
 
 	if (channel_count != state->spec->channel_count)
 		return -EPROTO;
 
-	memcpy(scan, values, channel_count * sizeof(*values));
-
-	/* Buffer state can change here; IIO rechecks it during the push path. */
+	/* This is only a fast path; IIO rechecks buffer state while pushing. */
 	if (!iio_buffer_enabled(indio_dev))
 		return 0;
 
 	timestamp = iio_get_time_ns(indio_dev);
 
-	return iio_push_to_buffers_with_ts_unaligned(indio_dev, scan,
-						     channel_count * sizeof(*scan),
+	return iio_push_to_buffers_with_ts_unaligned(indio_dev, values,
+						     channel_count * sizeof(*values),
 						     timestamp);
 }
-- 
2.43.0

