Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA430D403
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975050; cv=pass; b=gE/1d/dfsy5u/O9gy0A5GCnRuKqDdT7Fqor+5QUSioR+SPDsKVGo24JC/FEA+Nm7qygMgenpuQkPQ8Pf5XvIdLk1izj0DFY+oJ5wV6ZkbO/jz6Apng42xVmKz1YC3C+rYPmukJ7cTp5aHtngAWPg5+IU52xRW0RFkM8ucZ1vGz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975050; c=relaxed/simple;
	bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TT4ibyqNZNt1mq9LCrKlL/mxcantOP/xot2aA9TicbLsWijnlAUo465FFpyOcG4OOowfVflf5Zj8jRRWWUaMft0jD4gt6cFcAFKbPO0681THdwAdG/w+FnR1KHVULvdJ0t/KUqPt+JnRo7BzR4y84+slS/AZ2uxeIQpxtqOxP4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8MDju95; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8MDju95"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so1756c88.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 14:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790975048; cv=none;
        d=google.com; s=arc-20260327;
        b=DWfLdPK9ySDobYZRup91zhR6pF+xiP7H1WnpiGYrSAe6uWqzTm9XlBcF+afYqS+sTi
         +8SWSg46+ULO8J0Mimv5vUGv22xqULBY7xpPv+cKkpWl1WwLhipVG6Ir4AtyU2EFgkwd
         pGWanK6z85oXEZ7sc6r3dFGR9oEnu9qWanHF7zm9f5wb3Uyz52ed0ZC8CmWLxaXEw7zd
         UsdJOIuSX7P8ZUunD7TMlkur4vVwFqWRyWhXbQQFw3WriWW0RU9X6syKZ2AxtAL1OUfY
         PhPo960pHPma+bUPp1cK6sS5m9nMrzyBUZTcG/kRkZQIaQ+btZoscgC2tfnMibcg9KvG
         n2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        fh=VJtLBezAKbntRyejyoAwM+LsVHAGR35fJbTLnCSZQN4=;
        b=ABxOIknUqvzQcaZYrEc27Gcr9iE+mq5VlUCHzRHvZfc/CSdjqZAov7tbLdlYiCuVgZ
         eRew7tcVMIS5blkLNMoVyVKRNM+4rmb7RaQXphdiJoQbqqce7jFhCEG+3sbYOsp6HgJr
         9H9MNsgZLykVfVlxTT7TcOyQajWELGBjlt9oCkQaRiPbhtEnVwAV8lqXzcezjHwUIgXS
         xV9x42x8KjJE/uDiUyfwNF4Tiq0QpAodGX7DtLiR360+Q8Dt3FLfiyHXc3cOaa3MxQq+
         buV7hSYLnZ5R46mJd340/Z4Gxp5PF7DplsrrLVNRKly0FubRs5IS/8Bqz0IMa78FsrNz
         /RqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790975048; x=1791579848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        b=F8MDju95lMzm2RB0DBPjkvKX0/uV5iBYuLMom1OnZeaB+YmTWK5ac1o0tJYNZXnyDC
         DiFp+AL+4iLGL4W/vyUzeWgeJc85aGer5E2CcTITTiA1vRX9nPgg2UQbSW4bEgpKWcTk
         v+M7xSBrWWc2iURBGNv86TSlXgzBHZwpl6cWn57MiSVI5VNZGPR4AXZ5NBqDtzWuxqn8
         BW1gUdrcqVfvad4UbtFAblKhfQd18qvxH8le2tWrSM7K251WN2KXxoRH+55YCUMYvrkc
         UNIyBqREWKK19g5QN7xdXuRI1dDHwBtlXJ5u4+4igdLs/+8ojuZzsALRgE4bd1JTZZC/
         Xnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975048; x=1791579848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        b=tHSBm8KoYNbXQY1bPjJ1eni5Eolh0B7aNHwWzsWbWuXU4umaQIo24ikBQ9K1gjsMy7
         2dbiUV6+AeQtsrx0yY8YbKXQjcmiRyDDerTkE6WdUqohA8l89wUuUQbKidjhgUg8wZ9w
         RmexaPZwvzq2dKDbL5mc5apW6b+/j7xj3It8jVmmyjPwT6uZp9baAZatAKTMuT92kLfF
         hTRklPNpahmBQG2sP2LuYMMujpXEmZE+SKGlDcFmnWkeLnEsxpYGCqlLIpY2oaJtrVoo
         sMJtd8YEpw4fud/4vVDqIE1HK1zgwEvJiooRyyKw1lE6KsJ09EjbwARagbT00V7q1DxT
         bwZQ==
X-Forwarded-Encrypted: i=1; AKwUvByejKZCuCWHzywGRxxDeV8OFT/iSUCHS/5dLBUN5lJp+LvwBNj91p6dYRZVrqnxjX6EQo0V1OpHLKdE@vger.kernel.org
X-Gm-Message-State: AFq9FYK7o/BC7YuPbHfksNjZ0u0HXoxGgAqny8dG5jUtgUyV3CTx/WhM
	HLz0Zl7aA/CpCsx3UUV9unolLe+NFN5W3WIGk7W/L7qKNWMoIPJFWejFRjWCMP6OjusZk+Ifm0O
	XGhN15yxX6lJqVB2Z6XzlxCziULZi0TU=
X-Gm-Gg: AYBFou1WX5W/+rTI1ZwARi+4GEUKEsp8ng43KkY1olFLoKJLr1wvBzsI9XmDXiFtIKe
	b6CqbjHDxDcjVRlzpXcS0TMCl2jfykKCT4Bn/pGHWKohOr57L54v/B6zTaOwxuXy6JtSjRy2P5p
	q2ts7ra/sjLO0aXVa2rJit5N688QXKf6S4WGMm2tdS4w2trat4WXsgb0QPKI6ClCw1/HCQy7RO+
	7HgRXOqtoL+kwDwYMduFgJ/9sEQbpStQdV4heChCsY+lxeUYjUzBkoBbGtb52dFnOUh+oEx9j/F
	iVm1LpWWvFpnHP9OBqOyW01KOgjwDuBFeD295GzWF3l4Pim7SmgNA5njjBIeiAXNSL1axh8Yd0v
	q/Aom09axgInNirjIkp3XrGM2PcQPEUy89lvVtA0KeNfcIi6uZRoicre8/LQeKBLVy+mayVKwz1
	zDEED+2oxaBPQHBAYMDPpVIAVuKC+nUL2RDvkk5CSrwgUcIykl/8A=
X-Received: by 2002:a05:7300:4f1c:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34f1501d239mr5973962eec.1.1790975047903; Fri, 02 Oct 2026
 14:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122444.475-1-nils.lehnen@proton.me> <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
In-Reply-To: <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 23:03:54 +0200
X-Gm-Features: AclHuK_dXuGnJOPYodrtO7InoqnggBz8eivzSKeWlZZf0S62XMBs_UI8KNZJzwU
Message-ID: <CANiq72k=u195jL_Ki08pc44DfmL2y+CMv249gSE6Ocp_RZLmsg@mail.gmail.com>
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

On Mon, Aug 31, 2026 at 9:45=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Looks fine, thanks!
>
> Rob, Saravana: it would be nice to get this done, please let me know
> if you prefer me to pick it up. Thanks!

Pinging about this -- happy to pick it up.

Thanks!

Cheers,
Miguel
