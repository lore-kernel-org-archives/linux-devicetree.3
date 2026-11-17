Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936395;
	b=YZdXtOM5X57Ggy713XQMaUgeE0iHqE7ytL83hg8duhd6mNFQACRC6fqUsGMnt4kthcf1
	 tS0UUGq+251tHvVviPuPbXEy6MHX658zdO8bXw16u2WrFudGNUQl0V2OFIS5aAR3fVxq+
	 jzDbbiodGIkNiiWxvNnFyx65Dx9QFo3ePXnGpKV6EP4xa1CxuZ3365nnK4H+5uZWbQMLo
	 hFN9nf3iE1y+6N9SDChZgSM9NKIodjJz+U5B+5ISl3Xib8kHollC/sUZvqAMgyC2uGQ0x
	 MdRqKDvfAXe2VqxJpV7IPNOXdwLu9r3D4IGjjB+4Wk6g7RYhcvAJHqy21SA6dqjSx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ilc5G8/+9aQdYBwvZEflFTD39tX1L4K1WEy9bWOEMNM=;
	b=YBvJYEG7ZDuOpj1bFc+gs1Jc02XHPmlc29K4DX56W9udNSbKSrSSIdsVBrNM6qHxsD2l
	 sQlZSQlLwrgVlzwhA52C9JA3n4sVz1FZcOFc/oY5IIv6ioa19AJomZxCwVhwvDOS/6kHu
	 IxVaId6oM786U7JP7/Kxy5ZTdAC4bBdKqzmGeEyQbySvHcSidEUTWrxeSEhKxrfZEE/Ko
	 p7f4FixjWhUsCT3p9wQa4f0+xY9rsHzvT1tzXs5mEFB26ATwX9e7wL3ALwND+/TPuJmqg
	 6F5Kvw6qagj4lnKsk4ysuX7vnaJcGU18AQSY63km+u6uOAVJ3AuRWK0wX/Psk/YItaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B80da3Sk;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B72D606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B72D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B80da3Sk
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso863672c88.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936394; x=1795541194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilc5G8/+9aQdYBwvZEflFTD39tX1L4K1WEy9bWOEMNM=;
        b=B80da3SkgBI11VadNDdAFufDegu8m3LbosxJ910Pb03+r/lraAIaeoWVSAyTuAKbU2
         /XWZf2yp0sgkjPdPjoEhhXBcw6eU+x9qN4PbpyqMlPcydZM0g6kAvK1LrS5diujAmtIw
         L/1aN6JoRkr22C+na+CwR4sI1dHML/+YZROfBtqQmD7+YuoDAd9fLAFTJqncqpcva6/U
         HMIdo4hI3KL3ALTOIUAdiTVTIy9dG3OAw6FTMW6hoJY/DKISbzvV569JB2VJR8tiAz8g
         rmDIebT1J3lhY9JQ1awTQ578oy6Ns2qnbPF4FQ0HlLzO7zq6l6xUQwlev9MXenEYi2Gm
         Q6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936394; x=1795541194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilc5G8/+9aQdYBwvZEflFTD39tX1L4K1WEy9bWOEMNM=;
        b=V7ylck9m1CwmE/rkk2d0Nth0CiJkQKWDIDi8bj82mYEObRcxB2ejBaxlsZiCPC4o6g
         FAr5w6qrntFE0dlv7p/cDBREmtmlss/+Y2azDQQFzB5mg2W1u22b9LbW7XGoh9EW9JBI
         RgLf9SNSwJEqCbSl2XBuTCKtdgYG0xZv59muUEfvp/G97CD8lPJXbklL+t/0lkncPzPF
         JjXBwmdSFcpeMXrEzBp1jNMI9t+v8BhV9On8ITJcBzj1KX9iwcaQykfU4KZqycd3R5t8
         tYTgInkOyOdZiIwunlo9OcUpKQLKISkA4YN9DIbsfvCNhaXtT/+dIMuKQ5PnFnk+TWn/
         Op5g==
X-Forwarded-Encrypted: i=1; AL+hErHobA31Dn6PQLxiBhvHQzF5Q/KLJcRjBZr91JbXUPYZYvOgM/YS+kMTEKA7rdP1t9e4CNckPVouFAmO@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dfbt/EYv9P//4YWoQa8CvVS7x6eT0nmgsledn/u/dEPXwZ1qU
	JutWHfVWeGZCgrqQZcB6R1prhoNdpbPS7DFE4gjWFDi97/shGc1Ibylo
X-Gm-Gg: AYBFou1wJ34EwpwGuOXvwMh4dVxt7hOW0npT02iLUjr0ALEy/fQjEQmjmsrJRDAXiR/
	d2aKYoqOM+tEUGgOONmS5xQrYNUIwznDfiR6oajEZV4pASKSR/+Ojl86ClJytR+QXI6EdXrUgHA
	+hbI/nscCLuEdknMU+zCYMpj8MZZcNYXCtlg2WIcKinDS/qNVwL5RNz+21oroy++WVi7T6N/Ecs
	QOkCtmJTticE0HVcoxGE23tiYBYcc+sZ0HGo2o8pZgAZpE0EU7FUKgow5dNR/lh2ZsNSAa4PbOx
	4MxZatsABSPYXmpyyAi+yOKKmaSDO5u8p/pH+e9tP9L8yBnhWjvo1IjdJyqrRZFNEKe+CvYPI10
	kz7uQ1GSy8w/F9FIlGKqq5v8VlhllbQUyH4suhX5b2GeO0ZYO+Nz0jLyp4tIFYR/eRBMPYL2dQw
	EbjqL4sKrXDy5ka3VF32SAKgYPMmrbTh7A60vPRSGsANO/EQD9vqOn/k45FwcDhQ3VBa0+Kn09f
	FNdxi+R5+hTlNl+tOXGWMH5zKtbyslDf0ag9FDz9nHtFXWECJ0dPnYpEkcHBpI/LMoS467KaxVW
	KgVfl3fhDWak+iTLzecLqcS08R+afLgZr32dEYeFIuZesyz+nvvn7j6fd4d7u+kSMXxGzjfZ+Rx
	oWGj+aLYAZTy2pJJOWk3KA0AMtoAlh/HpMRM2N6bgr4dj0SWgiBGjoSxJk4s+/YEVAZF0K4CrQD
	fVaNR3VxcepPnhfEuTuKOqufHpkgFvdmgmwPeFe9dbm9kr6HDNc9ytVT7h6v3S8rY=
X-Received: by 2002:a05:701a:cc90:20b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b53a470058mr2566794c88.20.1794936394335;
        Tue, 17 Nov 2026 09:26:34 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm14263079c88.0.2026.11.17.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:26:33 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 2/2] MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity drivers
Date: Tue, 17 Nov 2026 22:56:09 +0530
Message-ID: <20261117172612.25535-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172612.25535-1-kapoorarnav43@gmail.com>
References: <20261117172612.25535-1-kapoorarnav43@gmail.com>
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

The Semtech SX9310, SX9324, SX9360 and SX9500 proximity sensor drivers
and the shared sx_common code have no MAINTAINERS entry, so
get_maintainer.pl only lists the IIO maintainers and reviewers for them.

Add an entry with me as reviewer. There is no M: or L: line: the IIO
subsystem entry already covers these files, so maintenance and the
mailing list come from there.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..f1fd14dfa448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,14 @@ F:	include/uapi/linux/selinux_netlink.h
 F:	scripts/selinux/
 F:	security/selinux/
 
+SEMTECH SX9XXX PROXIMITY SENSOR DRIVERS
+R:	Arnav Kapoor <kapoorarnav43@gmail.com>
+F:	drivers/iio/proximity/sx9310.c
+F:	drivers/iio/proximity/sx9324.c
+F:	drivers/iio/proximity/sx9360.c
+F:	drivers/iio/proximity/sx9500.c
+F:	drivers/iio/proximity/sx_common.*
+
 SENSABLE PHANTOM
 M:	Jiri Slaby <jirislaby@kernel.org>
 S:	Maintained
-- 
2.53.0

