Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EB1F3BA2
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205515; cv=pass; b=sqFmrTpxFySr4JwiBguvEw5CDzznd09cUiqy1oEdSLkEcUToMjfw7zkbcW2VPNUQKUdHd5+Y3C5ce2DoJ7HClenLdLHR3jCWbvXlA4m9JEsmUZcS8F7+pEzQeHhK4+4UawXaLHlKLVKQzheV6gu3Ze1T0bid0AknGguVrMm8hl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205515; c=relaxed/simple;
	bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtPktJ8gqMLT0v+9F9s5yixcNWm8+a5H2FG2u2GHzGI+336aXe1LnCjOszkIoffiF4XH1KXX9qGM7a+AsGeUkL6PS8cb+0qUaqNBvaFlr2Sz+dfREOE0UE7Frbqkbc0fD9bGQXUIGSTggM3pV90Mf1dwXgNWMcVBAdfKUV0UnHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ0fnmqw; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ0fnmqw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384caf7b168so335080a91.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788205513; cv=none;
        d=google.com; s=arc-20260327;
        b=L8YTP0NO7NoTNNEzYCNvJLrp104cyTUo+PpI2NLwu/z3BLOeXHP55/zpU7m2X+B9Hz
         dTk/YUaaV13LUPs4rr8DrNa+waLB1xVYPjEF5jMu53jcUjTcPkhNGjS+QuBrSMAqg4uL
         ok+5CKjN1BJjoFwIxxKfXhebl2n09C9Jx/lK1aHN2H92Zg2ZyEnZ6guUKJ8GKlkD/rLp
         5NRkSWqqYxHLaO7/cMrxQtuyKEipJwGdRG+OMXpddNMmpfzbK2rl7g0qsB+EkIEyOG0O
         pVZnzGtw0Mfow0iLwkBVe7zW31c36Gp5S0C9WksTD3Ws5OfP6s2I3AN/EJybKFxn+1Va
         Lm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        fh=PScvD6FDx6u3+cZKgKfo8xdzkmaVWG6ofti5A4GoHEo=;
        b=l2JtU7WgSialz+QZsxOQF6XDfUioMSNDnx7wMcXLnP9zcREQ3bxAsMxPl7uTu3SS16
         MCWo8d6MYEUVZWCsWq3btLsuwJou1wLpZJjaUWrJVoYNZkWp8392ZspTspUP2+pPpaDw
         tm5SMu4G11ntFzORh/KJdUyLkabIMhkB8Ihwv5Ywy5H1cZ4qdBiY5HRoDI14gMZvRq9U
         55eqv1tSbmYirasrZW+4opFFCJfbuvFguHA3fqmiVoNWia0aFbLrCsMCYBIupz9ZPDCT
         f4mWUjyk6KVDMH8z8c0PXx5WvByPKRgcXsJBholeOABDv9pgVDa2KDncDsSdTeNm0lRA
         R0rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788205513; x=1788810313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        b=WQ0fnmqwEqXROfU23E1u3Q93KxAXTiyi/cr0TeJg7/mXcGK6G6HMN/hsUdx/MNiz0L
         BuB5RkqagR5+t2PQpsmiWGMRwCiS/i2oLJ1J/avHFhoHHuhWP1L5dVsNp1SPsqL7/i42
         a8oVmZcRK0oQVCFPlmSs8nb8ch1VkpMIqcxUq+sMKvpVG0wYn2P/Rz4YPDesPKYVUc33
         vxDaemah7xH856d6jVVZQtE+PZZxa/OofIiR/SgmShjzIov0HVLqw7Setlohzg6UAFXh
         WZ1PUyaXpPhC0Qktv0xif4c/uw6pYNaE0uCdhyNkx1zaJ9CSVsdRwlmQuH5npUjOL9Yg
         4YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205513; x=1788810313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        b=mlXOVfP7U51drPA7B7l3I3OyscHqfItvAwa+xOITf1B0KrJPxJKiiOot2FAmU7DJIT
         fDy5UZl1nLRkv8UJ1hVMiMyLL/0xAd8l2kM920rHFc0z+G20d/eSN2ASTUeoaVCbvtmT
         kMq49MiAbmci6k7I2HkCH2b/iw/nnuOxOHd6ZYrx5ZSGxn1agWlme7Sx8Wx3r7rHzxPx
         UpTypCGMupypDO0yz97ICbzXtudY7QW/1Uj6HSVooR7GAOVR28HhgtKXw3ghS5+kzm5V
         p++zntekdrKycN3p8/KmCufuSfchMP+WnboXZ3Dzh2W7wq0m+bn0CLI6Kpa+H4tdgHCq
         phsQ==
X-Forwarded-Encrypted: i=1; AKwUvByGrdiMB1GT4qXrxIPvMsXehbgg0ARfG3XGUrx0AJH1NooIo+3OB0PzcXdN8K3wjpKAIOG0tBOZ14vS@vger.kernel.org
X-Gm-Message-State: AFuF++m6fjNF20HNrKmucg+6PXE542xI03x0qrBp1XfvUgOeIBNTYBTm
	/43KkH3fyGK0LikNGhYf2Ewhljz81dzT4MAXTi6mxzSYBTt1/X3KUh3STkLZHUnQT6w7wMcSHc5
	V3mNd/QOnPvmsuXX7cwQz53R8K6sQR2w=
X-Gm-Gg: AYBFou0KnTj24yxGwJAFRxTSfG7eAdtgRJTC5Oevy83BafoixX2KxDfbl20T1+zCg1s
	4FIWgOX12kuWK387rpI9LaSPQT2aAdOxoE7c1LWX2CPnO173Fd0WdFntHS+RLFrldVmjue3OEh9
	GOWUt5Vjwo1FfNSZdEpNN5ZmQEF+ElHod1p4F0B1R0sLSh1/MphsbHJdbwRA2W/4z9OYsCbOK64
	fEnFzS3GbkBDmCd/7p63iF6+ANus5tSn2CNGZGiOKhZdSgdUP5ZNzw1fdCYY64eG1zlRHZZPd1K
	bVW5tzLUDou17cptnrI4oFJ73Q6NqobGmng/PHY0l15lvw1XBwAapGCsiSTAuAHPnmtjl9UQc6b
	DXCaIvyPdxBD3MXuHzhEJO/zpifdGoIxfoU0oxzkeNcC9kT0Kh85vHOi9D8lk
X-Received: by 2002:a17:90b:17cd:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-398bab29b39mr13817320a91.2.1788205513452; Mon, 31 Aug 2026
 12:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122444.475-1-nils.lehnen@proton.me>
In-Reply-To: <20260828122444.475-1-nils.lehnen@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 21:45:00 +0200
X-Gm-Features: AcwNN1UrGd_bZLkMVyH1G38N0kEIKnS8OgGaNrIu6lFxBJ9qf_B_KFzk1Mhm8lI
Message-ID: <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
Subject: Re: [PATCH] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Moritz Zielke <moritz.zielke@gmail.com>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:25=E2=80=AFPM Nils Lehnen <nils.lehnen@proton.me>=
 wrote:
>
> Resend of Benno's patch from the Zeroable series [1], as the issue [2]
> asks; same shape as the security.rs resend Miguel confirmed today [3].
> Rebased onto rust-next: one context conflict from the
> `as_bytes_with_nul` -> `to_bytes_with_nul` rename, resolved keeping the
> current name; the change itself is Benno's, unmodified. An incremental
> defconfig build with CONFIG_RUST=3Dy passes, so `pin_init::zeroed()` is
> fine in the `const fn` context.

Looks fine, thanks!

Rob, Saravana: it would be nice to get this done, please let me know
if you prefer me to pick it up. Thanks!

Cheers,
Miguel
