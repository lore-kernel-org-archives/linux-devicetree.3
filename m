Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586726;
	b=xyt2YOUEaqbcn+hhzNJSP9bcUP8CqXXQXithe0IZ+u0mmucSp2KPNsDbjFGRGwOZ1hIn
	 F+Q36Uq+nvSlFe9gQFH0Aelw0SmjBH+wZxP5mY+uwgo1OgMhnAGDlDo/Egb2YAIl9jlGX
	 CFyAVURiHMJLXYnsMVIJxEGGaP/rRovT4/BztK7aH/pEa9ClmUNwfttQHP17PlOnfSw6o
	 gAUoUHtprf/VdG+NKTFwThAwXe5oOvc5E8rg/cNa9Fn+xNZ2/ItXh2AvjCA8GpLFbI6OR
	 3vI7+TKYcsYciCB9I1F/TOSxlSYagxZI7QnPiSALwHpUpfVvKkSaThQlVG06KTM3acQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
	b=mhr1k7onaeId7JhLEob9yOhSdRpAzl7brPNktrKeQY1aWzd5SumAwpxpnYpZS8JU2BIY
	 D0EeaQAkvEjRJntBS1G+jLXuA/cczpCdxVowbF4dybWOI6ygLy4Rnj+bO2lw/5MC/OTqW
	 gC5lzXZPz0luRv6UNBWuTbS65qCWYllm+FGwaJzqX+k9jV5X0GeDJ+hHU+Z/J9iWrmeG4
	 YeAH/QNfEsAmO5mg7eJmBxaxiEFyF+xOc6SGVTuwgrJNdnWIx15DauUVUgQq+x7O32uaE
	 gf0hHP4IgSRPgku08jYxQdSHe5ePoM5ELYxT/UyDnn8QhYwICVcJyZbwwgoIvA0fCbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C989606C544
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C989606C544
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40f29667e6so273628866b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586724; x=1795191524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=f0BSaAfqvrF4YVCe0zL6bqwE2NH0qNrRF4mgMNPzpCdomHb+euxkiM3S0I0BfoUMez
         rwiZ1SGxAy/qCs+Qb9DQwE8VMfXB1mVZinJCFkVmh8sjIGvfhhSNfbVbBUmOPN3IOgG0
         gqLtcTpMO8r5s8soO531ZL8MPdnbMtoKWwOX54DEokKWNJdq2Ytd+9L8VFbZHcUaTprJ
         9G2ZkREvaNNmkZOT6WPseTtFfhq3ezBzAEDrqm2wkPDTPAk3PFHaVxywpKECjmsMvfVe
         tIz1s6d5QoCurGlPvAymyvpSfYcTt/V+tKWJDJELoSVQG3onfx+pSg2fF8UlPDXwWH/m
         +NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586724; x=1795191524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=q70BY4Z/DaqyL/pmMAhzdDB4/iFpA13/DE9MP8Eu9cWX2PK9tNZg94XIK+SISeiKL8
         qLUemcnyxHnRlfJiJy7m6q9M04jrRtSLk4nBKnO+irTCtFxQUyaE15gh2fLt5tP3esP/
         elN8Q0FrNzZlHIOTCqQlgoHUxQ9cGNRQEoq4zB9CZCzO9PQ+h60eXyCQwPFCLPwUi27n
         RpzzrkXyWAeGMJlXaJxdKRVyay71dn+dHLKX/GkbBj/yJQTpSB3LTvcwIMNjojQAqzAz
         4ufc6bFh+JC2E+VQDcJIUs0ZaE7Lcow6o60Cfeuh/UXmuLgADu9EuaQ9xUvowC7kb95v
         i0sw==
X-Forwarded-Encrypted: i=1; AL+hErEkwgVUF2dU6Xn9zktaVSdmME8x5W/HUZBMHV4caavs5FiIdr0AmpjLF8s/YQXKTIPAZFVdiEfkDA42@vger.kernel.org
X-Gm-Message-State: APuU4Z8lHILM8S5kpczYYPIJCC1cAFQOZh7Gbfy2xPU+nP3PJCUgKUth
	zyXo6UfbxqD4DmiM50fgl8q+5TQS8ScxPK/DdHeJ77DBbld0dKtxADES
X-Gm-Gg: AYBFou0tDsXaEiaz7V5W/x0RBbjYbK6e52kxVo18C4DflVsGhg6JPhC9+mMxs3bMIx3
	UWJnOlptfiGGpkpseJqDLOZO9cQKIHvhVryPJc6mlpPd70pl6RykwOvCKBXEyu2okR2Z51L4Ujo
	E/JynR4DiyIjJMzTQv5rU9jrFJno/um11qJ8p7OWUY/WSEIILyo6H5Tz2egv89RkHftIPtpqca+
	IZYFhlOLVNBw2jlaVKIYh96jDEd01GSp+H9iXTIu7uYGTrLISpJ2WpDtxw/iQV/i47Waflv2swp
	07lUjdK4Ruqq+1WqMHQG/0Co/beq1Y2o3XLLDnxkykgKowLORb8i4d5vPrdI93PSRp8/IohMRgx
	VbigbrvZawIhCwzUysu1zMVstImXKxLld1B1OjBb+rXDkUY2iqYMXKFd8L8gjG1S+7ctcVjVq5j
	ckAy8JwnJ4wABFsLO+eCu7iSFCG3WT4zMX88GqllxuVXKkaYBGNatE5uBKjGcAiwoag2i8GISv1
	gSOf3FrG+qDIVxvAEmDjVIjvYbczAAqzEUra5C8M7mQXI4s2mYyQCi0IfCxnC9dniwUit3IrygZ
	zFrx/EnHOMxqehLGjzBJozdk5iI3k2cDvYAvYHwDrtNOMOzzR8bXT2UCxWRtdPhHLE7OxTmYQ78
	ANaFyDg336hI=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277084266b.9.1794586724367;
        Fri, 13 Nov 2026 08:18:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Fri, 13 Nov 2026 18:18:11 +0200
Message-ID: <20261113161819.36847-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After further investigation, I have found that Tegra30 requires a slightly
different programming model than Tegra20, the maximum VI clock differs by
nearly a factor of two. Additionally, Tegra30 does not require the
APB_MISC workaround.

Therefore, remove the fallback compatible and add a dedicated compatible
for Tegra30 VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index bb138277d5e8c..2d5538a1804f9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -18,16 +18,13 @@ properties:
     oneOf:
       - enum:
           - nvidia,tegra20-vi
+          - nvidia,tegra30-vi
           - nvidia,tegra114-vi
           - nvidia,tegra124-vi
           - nvidia,tegra210-vi
           - nvidia,tegra186-vi
           - nvidia,tegra194-vi
 
-      - items:
-          - const: nvidia,tegra30-vi
-          - const: nvidia,tegra20-vi
-
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-- 
2.53.0

