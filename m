Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605992;
	b=oy2EXBc4+BwTnCUec0s+HBZvzCJXL8AvKA/1QPPJA2h958UvrSqSXYy51vK4Vs665Ldm
	 PxTOKo7UFwVdx4nKWQ7iSHdDUVQwuOQGGmSHaN7y75cum3aZlm45Qb9scUzKzCqz86zcv
	 8UaxPcDx4omlkcxb/CKU0TMdQrplZe+7aJQ4hMeTGzQ5zNstcnUxsIoiO1+/sGGjNvdHu
	 E69PhVDX6Npt06WSEsZ9XThvPxiz3Rzhso/ag+OX6jGtBYmfTcmfoYOJINFlJumpyTxDI
	 MH9nBk+KdFWUMSmkquKOzlrlEQmWH0YI/x/bCx6zkl9xRCOC9B41NxrVBI9odJyc2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
	b=3H4F4afIVnqgjDwM+ORtQ3ieN0oTwBx76bdFQnWzNOi97B0kpxKU5ziUOfEV3vtm2i7q
	 gG0Jm3Aqk9aetiTZmst7LbbwCW4HMD2G9wQm+x86QjcAMRPrNENLxqyFR9r7pJZbtTWbF
	 W8csvCwGaCj9eKC95rLBJ7kafiNDuBpjPTU3rGpqIry/CI7VXo/siF7ZDLQ8668cqmUp2
	 rctaWLKLUa74YFo+pnejBt0tU6a6WNJy6unBbI83dhjbp9c1R2uAO4BZpjUYk73XcfqEf
	 bhtALrzwCPcGwwCEDu1Zlz+ox3clzVeam0vixin61SiMF8aFnhNDvsy2ZS9tBgZXg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s0dS/JiL";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F1A606A69E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F1A606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0dS/JiL
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so6590374a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605990; x=1796210790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=s0dS/JiLcvpL97aX6ifBN8UMRnPbAYEY60AlqHPB3f3nGYubja252dFE6hKi9nwYdo
         DaZyGwWKZ9wv9TZX0gDQ6BYOoZibctWuin7ZpiE10NcI1AxITIxW9zCTqb0JOyH8dihW
         iChCva1BH14OmMB59y+XqSPPXbN+iRzP9Lr7h2MRJGz7QOW3tqMrhHsbrKfVm8OMdBr3
         gNfY8L07HP+wI5KSbLHthbJaDFKnJUFtSebD8Yx4zOMTmv81ooki8nwS/k5VAbsrBhMB
         xDD7PHWC7G761goRY1lOMcc+u3ggeTvCQbR0GmsGahh0MPI8AAM97eZ5O2f51AY0G8e/
         7RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605990; x=1796210790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=2AxmUtOY+AVmtWfXwP74pttEXLq4okgrqbMm7IIb7aE6j6/0WKAIQZ4lj2BnaCtV8Z
         pOmGjmOb+GaEOoHn4EQAo5qwqiLYbb03EOan89GGBCSZ0nIQvy8S8ch1ieHUrI7HAMPL
         CVdYUAgmX7gKl/1XM/86JHOaViEA4G1oJ5oMYpH/paLxkmd+adxjFPZpYOfEtmZ3+bXh
         pDAqJNFNjLIBnDLW2FGclg5Pm9rldnDvUiM7zeAzb2lK0r38RsvwlJFgPUC+qkiU6ha9
         hzO/lNxla7ai2R0JCZa28q4dRrkzTtZpMvIoeJalAm+spJAdZHGXUtLsdtJ+PzQrQQJo
         zWDA==
X-Forwarded-Encrypted: i=1; AL+hErEcKdw1PhtzYQ8aI28d6nH7Q1ug/9f9l3Rq1TWtemZhzkZET72957s/HQMHu9Mf6cvTsqmjQCRFDYpd@vger.kernel.org
X-Gm-Message-State: APuU4Z9HKJx8nbe3QraGgqmdW5z4DwFBriDamDlSSZARLSwf1gE41bAL
	jJpOKXf/tmwoK6WWQO9k5g2OkyPDoIhgLsnB16DbRGmpp6nD2bR1qmap
X-Gm-Gg: AZFdTZcXE6XZMOQQjdpPE86yzemWRGZ69DDOchwprGg7D4m/bRpx1x5hO17kq9Wnf9X
	ht72wxFuXmTS0SSpEpJnJTwuFbvzFavt4PRN+xIbT5Whdv16lfGAM33jUdigmzZ1E1BkcRZrK+d
	bQoXL8FQrli3bdFSrE9Fa7n2GQX2X+mPKrYNDMK4oGZmZGduyf6qjRjwOjisya5u70JQZJEqSro
	yzUqn2S1pUTDnLUSNGnM/+TmIU8Dw5NwUsBh2kxmPncmGjEuJKuDyAeBkOW5JzbVGVXBWMIcCew
	9SzWiUNduTk1gdGJWyNSkSt6Kxodiencc5R+Ob73/494wPRFT4qi7Xnq0/Dnxd8/LOH1Pt0ziN2
	LYk4oY923f0+HrQsHj4iAeO3A2KoMS0bit06Tt4Kv5YcfeEKYJcNCXS7uuM3YAKH+N9sSVvR7le
	BtmlFGuSyEo3+DhrMOFLtfG8Qr3f4rpf+Sgz+SV4bMR1g9BlpbOSD+jlyU36exQgl4DP5VSwbmm
	3ORx0KFrYPXa2qVkxv5P7hGBqFqBUo9YrPTvTWKvkQCXqFjcyu0eC+/0q2T135aFr2jGlJYZ9ae
	kwX3X9kaaK3I0ybJKqsszNS+gB9EW9q7vDDbi6w5YiUMyi9jpupShUGkVGV1y7S83pgvEvaMJ41
	j3j67gPh2QQ==
X-Received: by 2002:a05:6402:4028:b0:6bb:2a86:1a58 with SMTP id 4fb4d7f45d1cf-6bb2a86201emr1407592a12.43.1795605990172;
        Wed, 25 Nov 2026 03:26:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:28 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/7] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Wed, 25 Nov 2026 13:26:07 +0200
Message-ID: <20261125112613.237333-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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
different programming model than Tegra20—principally, the maximum VI clock
differs by nearly a factor of two. Additionally, Tegra30 does not require
the APB_MISC workaround.

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

