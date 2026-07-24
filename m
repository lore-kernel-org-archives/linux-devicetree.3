Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED19E3BBFC4
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880110; cv=none; b=n8XdEOM4lPaVr46Pj6MxQu66bh1CmJ9PRUf0Pv6VgJhh5AcFvSEkle5SfV+F18ZTU65BTjoEjg0mVP1ajuXU75DfWueYRURdBLOPCr5LANemA+01sbvAcQ1T6YoXbCXeeUylQowXOg3DittTu3VpO9tXYFbHw26Fmq9vYHrZ9RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880110; c=relaxed/simple;
	bh=++8P9b6t3+0ruZz9HgjzfNrk+tJ70euPx5DFBAKOAjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LNwO5Moj0V42FBF5tcoVrBXRXRSCqGhZPqvRGatKX292dTXlpnSRantm8z2OKggk10Pon91DzFLazG2/RiBeBgao0uskUNyrCEFl5YASer9zq+Da/GRXvfj7nI/GJRkhoBmVq8VlSlOJvC31Mznh46JCFPgzQmTXaohwn08N/3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gQ0Y7JWU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gQ0Y7JWU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so6241645e9.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784880106; x=1785484906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAfX3k5wj/8KZVt25ucKMpfpE6MXGKKgl1Anbl2kKTI=;
        b=gQ0Y7JWUoXU6SwWLWEC+HkTck+vsElbO+RjfjqiPh4qig/yMsthqRncW0vlFosGiFE
         TqYSkYeHY5U8PccsWyIV36gJDIntLbg7wmICp1eEVyaTPv2D8ranUtJ4pERVEdAKJat/
         ZfJ70lz3LVNpA6KH/VcNx8sNDC7lpNrlgukE/SSr5BvYtIYAfVaZsviuTFNvXDhOrhym
         atqyAJiHTKesroSue4KUlGV89tpXMX3+QnxFhaESLSq3RYnMUPivOV0aHdMpQLZPz7O8
         hx+ns1u6hpVUSTo4Ednog+C5jvx968dlPyek/kEXRT97PFAf09+1ywuuiPjk/B0ABEdp
         GgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880106; x=1785484906;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAfX3k5wj/8KZVt25ucKMpfpE6MXGKKgl1Anbl2kKTI=;
        b=YAuPKpU4lFKH0BznMXZVKKsWZXa+t9CxRix9gsIPI3zRW42WoXgFzIETAlrJUQ2wSh
         qh74170tcfT3NLkfKCTyqyekWGMrmJfsi5CudeByx8KxqehDCPVxg0i8Z5DSiD4vTTUV
         T6qFjbEvKevdoxFAG82qRbiPZCOPRhCKNOChwamZG82h656pu1VcIUSsJzNxk0hiUx7N
         n82ou0OWPm8j31/BH0u9iisWSFZxil5asSCsx3qJfPjSGEj8nAU0u4r2fcCCCTzHJUR1
         /tecAOjaoQqs2kBBhWAV4En4q/B7Ta9Df93p8Aj67OvHiHW5RHpW0qJeuMPNrgyO20YQ
         1NLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJhIc+Lk0MdhwZXoVde5j5Abw+Dpq2JQPHSP3/019DLiDWcRsoaAqLXvrp7gEkg8SbcjrmcR+bnFDh@vger.kernel.org
X-Gm-Message-State: AOJu0YzL3pABdDk9qxgBlbR3wt6AW4T8h7dGLzzCxV8QuxxmodVxmWZ8
	64zDB1e+SEEFYu3IiLgL3Cl0xqngE9FGGUDxm8KdsF8AO2IP+/h+DlwNH+RGjwCS1AE=
X-Gm-Gg: AR+sD10suC5/NjMWTi4+k0CSO5z+0EgZBV/QensEVBZdw+Wg4kBxt2TBJgDF8w/5Wu9
	ftm2UWhFruLCAZpG5xCLrlebfn2xooX2puQcFhMCUhVg6jeUMsNz9pbxf/kiObG58UQ+zrrIaI9
	B3pxnYQrPEs+sYCkOP0pnezWy1V93C+9sTRi4dl7FJO+f0bDEkj+mV9Eo6DK/3GGYx2bwXxShUp
	76hG9QKN2KZRtSNSzcsmYOZ85ZGKJ6AKOVEBYducxOTQp7rXKRHL4JljZzvkq2WZH48y6SAng3G
	UxlTZx2/Zn6dFQ4nJ+s6WKIFEIVBj1GomcLsQO4hmkPqpprrdtVfIp9852CJJ5/sMRafOCM1fF/
	iZvmoFBT0twU8r9uk2gyqXvX+RErD5Aj9JzYRK7hqH+ImOnzQY+OiUPLioL8/s3THQ/66Uc+dTL
	BxU5TyTlPTF3IlxyDINwIYiFo=
X-Received: by 2002:a05:600c:26d3:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-49574593d20mr42472695e9.7.1784880105557;
        Fri, 24 Jul 2026 01:01:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d4d7sm54404835e9.2.2026.07.24.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:01:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: laurent.pinchart@ideasonboard.com, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com, 
 sam@ravnborg.org, Leonardo Costa <leoreis.costa@gmail.com>
Cc: leonardo.costa@toradex.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add
 Toradex Capacitive Touch Display 10.1" LVDS
Message-Id: <178488010464.449291.8023888105582692289.b4-ty@b4>
Date: Fri, 24 Jul 2026 10:01:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Tue, 23 Jun 2026 16:57:36 -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> This series adds device tree overlays for Toradex Capacitive
> Touch Display 10.1" LVDS V2 on Verdin AM62.
> 
> The display addition covers two interface types:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: vendor-prefixes: Add Opto Logic
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4685230d8288a99f1c664768b6eb2bd1545524c7

-- 
Neil

