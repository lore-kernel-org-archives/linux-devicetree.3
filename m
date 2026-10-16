Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B1E369208
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142313; cv=none; b=Now7nY+LS7cI6SlOnSmtdsdIQsv+C97lDlJybLQZmdxAx8rO9kbg1sTVcravIFDunMhz694GP3IWtOtk/PYJ2/8N5yF9niOprWABzgyBaYdcUshgpmuJjYBgU50qOtEoAaiBKE2Nvp/uzVXW3tgCqBvVvNY+VH3VF44MP/aVGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142313; c=relaxed/simple;
	bh=FGg5AJRfS3ZzNgEscIlskap9vuExzWRnghK6C13zNi8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=W02PXb5QWfcpp8k1crEQiun/mnY2xqogYV66DjW//6dP1OSOxBp1vw8lhQXriYwD/pPWEj6lPl0yP7W9cY7Md9kfXTDec5DPhaAl+lBkb5uLq3uLBbcO9//3A4blx/eX8vMTQZmKzoxIJl9xL8LkdClT4ouwpJeIum7A3plFrOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4WiyL/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4WiyL/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F4B1F000C4;
	Fri, 16 Oct 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792142312;
	bh=/0QkBPOVoAwtglnb/3V9VCkilTXblKtKVs01JSDNwK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4WiyL/7XmHm7V9xHrUoXmaHFkw8jvm71yGPw7b/ZGNNUJ85me8gK2VifRc1fkw69
	 KtaS6kKKWGLKwB5WsFafdg6uV+mKoKXHX75qN1pRVaKQ1QvSZzHmuA3YpbXcHApm6B
	 6/p6H5GAXiiVexDgX5bOnf0VpAVBcUz17giyEDlWksTm/gWtg6biYMH2cvvCRBvNGP
	 1kcXrap3nSeAiE8gfeY2bBVY74EZITdYAWSM1SjWR0Q7Ickx29x9/boXc0uOT21eJd
	 0TRJgLSuq81nVJqFghQQ/zholudlsypBMa9v3s/mmVzT+Y5Vi7qYYB8LXQcRGtYMYU
	 949wQb7/RWHkA==
Message-ID: <sashiko-outbox-174065@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document
 DW9714VA
Reply-To: sashiko-reviews@lists.linux.dev
To: wyibo6109@gmail.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261016090930.947830-1-wyibo6109@gmail.com>
References: <20261016090930.947830-1-wyibo6109@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:18:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: i2c: missing constraint on dongwoon,sac-mode=
 causes driver truncation
--

commit 84f26b8e140dafb250c88ee38251a980482fc1db
Author: Yibo Wang <wyibo6109@gmail.com>
dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA

This commit documents the DW9714VA silicon revision found on OnePlus Pad 4=
=20
camera modules. It adds the dongwoon,dw9714va compatible string to the=20
dongwoon,dw9719 schema, noting that this revision uses a register layout=20
similar to the DW9719 rather than the standard DW9714V.

Link: https://lore.kernel.org/linux-media/20260729-dw9714v-v1-0-3c479b3cf8c=
0@ixit.cz/

[Severity: Medium]
In Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml at line=
 40,
the global property dongwoon,sac-mode allows values up to 7 and defaults to=
 4.
However, does this lack a necessary constraint for the DW9714VA and DW9800K
variants?

Looking at dw9719_power_up() in drivers/media/i2c/dw9719.c at line 133, the
driver handles the sac_mode configuration:

drivers/media/i2c/dw9719.c:dw9719_power_up() {
    ...
    case DW9800K:
        cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &r=
et);
        cci_write(dw9719->regmap, DW9719_MODE,
                  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
    ...
}

If a device tree uses the schema's default of 4 (or specifies 4-7) for these
variants, the driver shifts the value by DW9800K_MODE_SAC_SHIFT (which is 6=
).
This produces a value >=3D 256 which will truncate to 0 when written to the=
 8-bit
DW9719_MODE register via cci_write().

Because this truncation silently configures the device into Direct mode (0)
instead of the requested SAC mode, causing camera ringing and incorrect VCM
operation, should the schema include an allOf conditional block restricting
dongwoon,sac-mode to a maximum of 3 for the dongwoon,dw9714va and=20
dongwoon,dw9800k compatibles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016090930.9478=
30-1-wyibo6109@gmail.com?part=3D1
