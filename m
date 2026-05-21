Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49C426EAD
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396043; cv=pass; b=PZjF93bsoBw0nEp2wc3QdsF++ooRILrGi89ECc1KpkUtBpjOaqID1Cm75AustX0Mt+Ox/pb/F99XtMBhk/6W7l0NDHcwflTfKl8lMMKNogdbD7ayJh2PMyCnerfoORIDe+foV/MWmq5AO1WxQULy1dCnLeIY6gf0x/zLO57ltDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396043; c=relaxed/simple;
	bh=yP8KGy66CLbX3Ukv+ZuUxw1m5EDntCMD0KN/FDeIZaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKYEdFWQpbpQWUtC2AlHzM6q7NWgtqA72P+txXCxtI1R6h/JqvsskhtVf9v8FN0Tn0DN++LU7AENOlBb7TG6Uq5ccMciEhwXZ1zaoF08dpjgXLDXwe6AYGeQEzUdqlwzvJPELhDTGRS9lIxSJcWqzWZdQJYc5rAtynX3l3Pszc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qXAgPBt6; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qXAgPBt6"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so14660482a12.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779396037; cv=none;
        d=google.com; s=arc-20240605;
        b=W2u/uXrGZjtVwWcHpX65YclPtLKW4L/vDo90IOR9dDMZ2xpdcKfnCmszALXlw7NHHU
         /b9NRvH1Xw/bOaxogZw0viFxGHkO0hSzAVKsBRG/BRyazXjvnjfGEozj/8tBv1mDuZgZ
         jd0CvmBEMnspOPgssQARCJfDDhMREHME7JBMTnE2EKJj1qjEA//JZKRSVoRqI/dtVbY2
         CIgOXCDZqums6rWb4vD2eWOXBSGpmv5qFFURCAGAEqlncAV/7uqcu4br48s97RYSK113
         Mqz7YeiVkgrMOwIYOlFd/ePcu0EKFz7AXhmr5ku9W0X7tuH5kOrngH0GJeF11AjEpytE
         EBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ze67pyM2HTEYXUgaYqNlhINPItrK8QSimCWmLndb06M=;
        fh=yXIZd9BTqBQRs/8UdJ61GqIBRvgntpiI7f0MJJScQVs=;
        b=QrLmeaTyA11s4l4cae2yLpZjIqhuCV8tfkgv1QzTHqDUhfk2Ay0L3xLrKVR100ZZSu
         yCd5RRaxat44zr1crZw/h+seuh1Nwr2oPCi5Quq92JKJh9NyA2rZ3onG5IIK8fGidtE/
         r8sjg3e2Mx5x3dDLwuJgU1VHJp+4ydX7WowhU5u1RBKRa0ubOWJ6Y6rDl5uWnLHhXeGu
         ddhB4+MhvsIU019XwvIqYWLJxAyY1HAcVSLMQKg83vB9NPgICN927jrPUwwoyIobfuWC
         G3tTNpYE+QBCVzkxAe8i4lurmljkog3nyjP6Gpg4jz9/vmbSgvSUjhWVERxpe3tAfWjS
         XRtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779396037; x=1780000837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze67pyM2HTEYXUgaYqNlhINPItrK8QSimCWmLndb06M=;
        b=qXAgPBt6hsrBJTCth2LPQZa80/CVjMNZyu5nT+fAIHelx5DWBeRtYBiDviN/abN+GA
         qWaywO0C7VHZsg5cDfGac8xRgaY7JYtduhamgJfMiAWab49nz2fvRPqHfy4/WGfVbMAU
         q2FMUl1HZQGXQW0U+G+w0YzZDARXx3Y6Cn5XowezhUoXmuhU+6woXUKl7Qw5/jwqTL6k
         ZeaHEurQQOGe6/Q0g9oUHPcdzD18dj+KW0B5mEUZcK+COMl95N5/yADNaMPaFVCYgMTR
         AOTxHcu0vQy8805IWA5XT6/75olED4NMn+ZW0NUVkRy0P4JrkfiGDblTOtplYMXGtfxy
         KYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779396037; x=1780000837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ze67pyM2HTEYXUgaYqNlhINPItrK8QSimCWmLndb06M=;
        b=BA8SeiPYAXB7GE7q3YPtvM98QzkMNMcqNWz6yIROFvVsM+o5HsLl8BjIVxOO2r/B7q
         DS1RSVW8IQ2w5Bu1yhLjuNg/mFatz0Gocs6nVIVxIqM+JR1TkG3XuAhG6UVFgudefA5Y
         NDGE6RL4jHky3qI1ihGpPiyjGyerigStfgmYNhaunKx72h1JdZPu27QA+HvDlj6Pnf6Z
         GGaHq7SzaHYBIXpON7SngXb/7TS4ZpDdcpRslLwIuqxs+pFhksENi1KxTIOYEAsnNj6i
         yaz4rk7d6Q6ZBI68BUL/YgMEBWpb5LsLL3alu0mMTWdGMYEsjgVxCf4ZJ2yRqto5HfAS
         PRWA==
X-Forwarded-Encrypted: i=1; AFNElJ/ox3k4Re8RBbYnxecvWvfmxCLWrhIFxsEwc8V0YMAFsSWg3OA760xFCqFruDiAyqjLpARUGCiRd+Mf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoob7PJEDAe5Txw8vJyX0hBS/zxGt7shcKY0ca7wccTaiAFqkE
	ZH5U48xXRRGFdpmJ7SNpbiyYYIcUaGdADfS6bVIa7Y9XCeUJZ9mTcuOTKZwlJN7fjV5qgAhFK0J
	SHPRuaGusoPVSq6zoVhk+scTxdY0/ow==
X-Gm-Gg: Acq92OGiV7Dyk0Y8EHL5x4Tudal6emYtqicf9MVo7mzhM8RPWa0pcVdyWswkvrQxUKr
	Y/i6wGF4+V1cLi7ARel+aPCQvVFpWoLdK6/5KvwcF3p1lPWBo1jeC/7uwi5RZbhJ57bzLrxg5ap
	WiuytNLfVDBWOhZFhNjYoYlBcvzOOV+TTKhxes2tXgL9C5X5sQE1hbX0JdBQkRYhrAVoTGsUwi/
	YFi+NgSVwTCDsXR2CdRx6cc6KeSFP4iOCPofZZ/M7WHbi/s0lv5N51pv0OPFqFBKKkVEkiEXlHu
	oxo=
X-Received: by 2002:a17:907:c081:b0:bd9:60d8:6609 with SMTP id
 a640c23a62f3a-bdd25aeec87mr56952766b.13.1779396037466; Thu, 21 May 2026
 13:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520191943.73938-1-arouhi@sitime.com> <20260520191943.73938-2-arouhi@sitime.com>
 <20260521-happy-celadon-hamster-94802c@quoll>
In-Reply-To: <20260521-happy-celadon-hamster-94802c@quoll>
From: Ali Rouhi <rouhi.ali@gmail.com>
Date: Thu, 21 May 2026 13:40:26 -0700
X-Gm-Features: AVHnY4KCHObbT3QYD6a24XRvhNNiY81MoJisfWuLE7Y4SEhAswnLI5R8YD5XQYQ
Message-ID: <CALFSGuoWkHYmtrouvLk2M7bWS1=qTSPUn5GuabFvK92cPBfuZA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 1/3] dt-bindings: vendor-prefixes: add SiTime Corporation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev, 
	arkadiusz.kubalewski@intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ali Rouhi <arouhi@sitime.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Mismatch in From/DCO.

Acknowledged =E2=80=94 Gmail SMTP relay issue, will fix for v3.

> It looks like you received a tag and forgot to add it.

Thank you for the reminder.  Will carry Conor's tag in v3:

  Acked-by: Conor Dooley <conor.dooley@microchip.com>

Best regards,
Ali

On Thu, May 21, 2026 at 3:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, May 20, 2026 at 12:19:41PM -0700, Ali Rouhi wrote:
> > Add vendor prefix for SiTime Corporation, manufacturer of
> > programmable clock generators and MEMS oscillators.
> >
> > Signed-off-by: Ali Rouhi <arouhi@sitime.com>
>
> Mismatch in From/DCO.
>
> Best regards,
> Krzysztof
>
