Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626844;
	b=NzHy1Gf8Rg36ydJv1C2SP/5Gz51AAXswg2+L3KvA3ITo4GPXqw4cDnENNvuH/zod0baq
	 jpVTafPpPKxls+tlKyKVVQ/A3gXlSALoVf/w5D4wc1ajFDYAFF/GA+Z3RKRarByVr+1We
	 8v5feaVK5i2igW7+5fsn+6zH+suVENEfK7XfoKEppVMv0W1G0nt9/3iwVPur9zRfUd4ks
	 EiHXFA29Ga+0OuMHFYR9pTxrxehSy59B0ih71JSxiPqv61fbRsCqV98NuzgkJBOFABSrl
	 nJllsRh/Z0Vf+l12UtExaSdjLehQg4+OcSSwQtBiXTUyLSNsFV8tf099e499VcHA6wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=oCuAPCpAXOO6RuODfwfptklGCvaTyAJZnsj2ANQ9dHM=;
	b=sFgNnJKTBZjgZKo/kionPiiI3uibPMRwRsh3e0q8L+MP47fzmyz6Ek4DIKe2vFIxHjJ4
	 dzu+SqpqrtIEoV+th8zEV9feLRpu24rJOiIRHO0f8mj+PSzcdleGPWrSBhcUGJp4sCJVl
	 Y8gwZp3KRvDmi0QyXVKV/CvrE1JubtbXwy1Ow5NzicH2Kbp7zN8lLqshZgwI6YNDbbniH
	 s0UZZ/mjZlBvUHBGKmNGhDMUdLTS/4c5xla1Wmn8dNDg2UVsmIgEufW6XVpK3DdbW9jvs
	 EYZYP/eE6idTLIGsGySJupfepCa6gwDsuZbldDVCwPaakBmj7bWNVGGEM3Z/XRQ5bqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aKVbvr2O;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF260A3812
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DF260A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aKVbvr2O
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d885929so2491092f8f.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626842; x=1794231642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCuAPCpAXOO6RuODfwfptklGCvaTyAJZnsj2ANQ9dHM=;
        b=aKVbvr2OSePQTPnByD3QDk6GBE6cccLpOEJ8xqmdxzIixkzl6289cv3/2LSFWw9LrT
         G2LEFjTSGdtVRA+HSG4m130NtMBLAx+jrKgfaSLgsdvG6bVX1VmCy8x/FnIA9ndPwnRO
         Xap4D+fMO1+Fzrjzpbtkey/xpn21eDM2si0Q/ZzKUm98cgB7a+eaK17KFXpLIsC9YY1V
         jGIKJbR/TDBAGQU2EY5TdLvbWmwNKMb9Uz+xAtmylBS7OtPGE1uLKEVu7/oj3w8idYXG
         171XHd6IdmJXPvGF4jYhcEA9BTPnjaLMM6shU8u2fi01mQlOrh1l5sOoQMvpBgraZZVl
         o3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626842; x=1794231642;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCuAPCpAXOO6RuODfwfptklGCvaTyAJZnsj2ANQ9dHM=;
        b=pl6+nVj1DV2e1hpgCvSry8IkJUvq+5ngyaZxoUvGvalZ190pE0qlvpMIwMA7ErUpcf
         90nNKHx6LJYcUjManbbb1l9VZc8FjOyHXCWod3a3LMIsi+FcxWRUqFtsF2OpQKZcUFZ2
         lHssnxWbL3hdrPQzU6cu/QTIohyILFqdMtLrxQcZTNC+6rzw/ZqD5XfGQlDqYaNfyP6H
         gzqbyc0SHuMdxwgSuvXzbp24yrQ0Uwrp1Y4PRsuTzrtW3nqUqUnLEn6IblmyWgsnM+jO
         WzmKRfFStsZ8eA8+WmLNT40xqyU96ng4kbI+iWxixN3DEq55eHEVhB6uKkQAuq09WlHR
         zS3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQ9Ae0dDdJ1uBxl5JqVDlTynvn8ga8cuP0obcabP50Jpy40xQUbeDua4+/hgBTo2FVoUJUhyngRcWQ@vger.kernel.org
X-Gm-Message-State: AFq9FYL1TfoJ9ZAPgglwuRVCZefiLzqgXjJHDB5Kn6lu5b3r6esxseXy
	Xz3rCkVzgTMKyZaRATk4hCHgHKVgzyXNukVr6yc+6Y8+lRXM1ZzhihbaOyrZrj7vKhY=
X-Gm-Gg: AYBFou06NfeGhBF6ezfmxWb/6DFZqjKYHtIzZczT7pGmc+84CkiCmUwQf/Xbz8pjH/I
	/uJqzlJLk/hTbgmVD71kB8Tk9zcwpiJ+UHP7vsH/QedaGLd9ogCuK9xQ/EipK8iXd1Uah/ZUD89
	sRNzmIy89jCPPkstXX4oqmeYxbBAhdGW+36Ixk9su+FbhKQQymHmErdskPWrE6mZBV659zwP68F
	2lWyDn1aU0reGCUw+o6zJFtmwS9u32DNh72rGFV3qEgKpYUwT5SHl91KyYsB9AL+IvTee/5Kv3R
	nWzoFPxwkDFJn30XXO9BN51j+AhCD5EHRXoAWOvbdHGQ7QjwMeewSsIIVkghOinVoYe2KgjP9Ui
	6bxqXe8jF2bvV6lazQv3tKP9TnKWEMSQ/wEU/C23H7KGYPZ4Wo8fw6DnTVg8O/sgQ2GUgGo0jZc
	GElokEqL5VG5R1FNPrcL1KzAz1/f9boGvn3PDELAgDJToLCvFP3J7ChYk4cGgxShq3D9VnEop7b
	wzyUMaN/8kAuL8URoxu8u8P9n9folod0mVjQF0mmPeU+rItIvcNotPVglNR6Bs2GBxfOgbERhPG
	21Uu10M+D+ZJFTaeyUIiqqCae6BF9oPkf5D3h5Da+2qxa6YUQ845XnWsTWsmnF+QJyIvBE0=
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4ac182dca99mr253947035e9.15.1793626842344;
        Mon, 02 Nov 2026 05:40:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Asif Ikbal <asif.ikbal@amd.com>
Cc: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 thierry.reding@gmail.com, sam@ravnborg.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 michal.simek@amd.com, naveen.gaddipati@amd.com
In-Reply-To: <20261016094638.2958431-1-asif.ikbal@amd.com>
References: <20261016094638.2958431-1-asif.ikbal@amd.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add AUO B101UAN01 panel support
Message-Id: <179362684137.3310106.8150068163787237277.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:41 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Fri, 16 Oct 2026 15:16:36 +0530, Asif Ikbal wrote:
> Add support for the AU Optronics B101UAN01 1920x1200 10.1" WUXGA
> MIPI-DSI TFT LCD panel. The panel needs no initialisation sequence and
> uses a single power supply, so it is added to panel-simple and
> documented in panel-simple-dsi.yaml.
> 
> The mode is taken from the MIPI interface timing section of the
> B101UAN01.7 (H/W 1A) datasheet and gives a 60 Hz refresh rate.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: panel-simple-dsi: Add AUO B101UAN01
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8f900e88c5450a40ef205f8e07ad32253a4ff7d5
[2/2] drm/panel: simple: Add AUO B101UAN01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/21a19944ab649cfbba0c5feca21f5a000b36dd6f

-- 
Neil

