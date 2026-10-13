Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F864E7802
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895995; cv=pass; b=D9M7X7pOpoxXupt6TfLbBXEw9ZRMgtukssXd9RoV1GDwV9BnEsSHf4zpo20xLaxH9utws+d5iP5bagLqv9BQ0llIxwjZlCyrN0epk1nwIOPMnQ/PoaVp5kKTZVHfB3G0X/Tt8pTrjt+2OpcKvPWEL8bPOQV0Mqe25011sbNxtRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895995; c=relaxed/simple;
	bh=UuiRmBadCxfqcfSzZSqby4/2UPwr5QA6sDq3PGs+kpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZF2Jqb3B4EGkvlRlIntsyXyGuoK2MdAhFf9KnQDvrHJMbSkkwtOlQknRSLQ0OroZ/sjTU+VY4zk+mAUvVPzld/u0mfGVMtKTlF+JaYsDcLSIxwJwFpJM7iYF5y6jyyz1RkabTeggNinUi8AVQ+msemKv6XzhyZfGiC4pQBwb/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2Y7Inva; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2Y7Inva"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3584f70a5aaso349794eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895993; cv=none;
        d=google.com; s=arc-20260327;
        b=eM56GW3y6smEKmhzpIv7ICVDeXRenLWX+PyMghF1lUY8xl8Z6278tlIjPGifu8LICD
         npThxrsLOJXSpKQ3Uekzgj+cWnmLN0j/b2DUjS58Y4q+0gD4gLXMdLxPY+1lGFipG1iZ
         S4+NSthfjN/MZ4A7tYptkSj/U+yylfWJ5w2ueqs2FH4STNh7IE5hmsTgSgxZIMy4bCo0
         qfytGle2VMUqD7dFZj63hoTmY6V3B4D4UpUGljsBHdXoNg3JPpZloc3ZmA7Ghr1LZ1F4
         fwpFFFv0XDIXgYLC+84qPhXT5rHR1BM9TJN6VI8kCTW0Z8g58VCo4I5umIZrzZPAtpD0
         qaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        fh=OeiliC1QdXRUH6Jl9jVnvdumk8JwDLn+YMnuUtn9Uhw=;
        b=OOJWqxN5s8BRWhqC26w+suCI2JjZ4zmcPwR3jhO4gtDlh5k81KbpD9Jgp0Z2qB5lkM
         0eDZ9uVZtCBBMOTZgZXuYps0R1qqX0H7YFD8T6VYIrxqgAUwmsssbvPJnNW24n0WGwPg
         jtoh7jlLzm9DPIWlRytrEHQrpNAVn+0s4MhTNr9A+JqNqbmcGXLWZhlEsuaxZqIuzwEP
         wf4uJW9kiWCFbho5tDzGfrX+0AePZrMS51ERuVhRtDa1h/Bwoz0ydiq3+LFj5ZT4WX6T
         AVRlcyTRoTaGCw2JK/xmhMu8CN+LTn9jjBtsgtRDP00WtNuKg7GOieeDxJYbR4fbGtm1
         nRew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895993; x=1792500793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        b=s2Y7Inva6fQGfLVIQZMLYFwDJSoX+mPdVI4FfdG0eb2ia54fUNsny+X2nyB6Qxzei8
         3iHPlJWq40/CURiwkEuyC7GRC+zhUqnhryntMeaJc19s7L/EFfRQNMFuOH/DfTPMYt1o
         QUwUd5VwKJQn6iekspQOHJ+kOeee8XwJ2DzDx4SlKNxz7kcxOlYO8Uim16bvHbBrjCNH
         gGqNhGGHUWUqE6SywQvCkjeL8IEjLvuKBsJ7BBF4Zo/wf4Ytuest/3vqaOMSlpheupTA
         Fu6QTdXlYl2TV+Lh5bwrZ7MhAYP6Sv/KPPdiljo8RHm4YWoE2D2WDPmPeKIVaXjPU/xV
         r+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895993; x=1792500793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        b=Ov3+tGt4ZDbw/0Kn6i44FR8ofcJj+b+vJGtIWaUOBhSbeVt/bs3SllBaxam3a/9lPA
         moeEQWDxXWeVJmvrdAL1wgPfWaXjuB31molklbI4U7ZrENeYZJ2lDw5m4NxO5Vw1vc/X
         AOpR/X+GUz96U4gpbk5uquZH3JcL93rA/sidBcm5cRCKWhAdIss7aDVZ0bOLhJuF6w1+
         /3uQK7YMp/JfHScYhaApiwIGz1hbFSzkdtka7eMluprlPd/Hh5SYUCnaFM3DTHczz78G
         NYFY7wu3FxoUqLWb2zAXUVGJGz0ovE5uY0Oz+TQfO8EDkO+7ACYykO+2u1coo1ig6Avn
         7OsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2vHymTGLdY0FHPx+EXruqbgOSA8OlU1C48CWm6Fft1Rta/UN7Rx216oKjKhRW7ThUZvpdETwt36gJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKUQc/RbshVYVf+iOoiRmt5WpVL+/5Hv0HVB1Z6qoIHwZvKEZPw
	96xv4HPynB3e4n84AOwlY6p+KkgFwu16VLD4N9wF4nYTuN15zUY7u/mJLYaDjmHK9JLEszu36Kc
	l/b7ovDFDafPJbxiwhuzJYr08aq+Wq84=
X-Gm-Gg: AYBFou2YHOcGqKuS+D5rmn+MJReL0j48nBz5J6n90DDS90Q47y5FpzFZ78Whd5kNUDx
	jUcaS3i3yHP2rFexpNorQfjuF95vgCNDVL5QqjeNK604MBTzL1EDcS8KGmr7sdY6gWPe426ZgUx
	ifrVyKXHP0m4xkMH7oAGkpOlTcKF3BHLRJ5XK3+xxGIdCoKBAcraQs9lqL8U42Qom6QLGuzC+/+
	u1fG5QWUHQILxLqkPrx+fsC1A+hPGPCHOo5wAy3LIfKJHZlDuGIurxxYY4FsnVxOY/brj02/88a
	Yvbz7nIkjcl//acvkYlzOLbYDutqaprgsMhrfUIUNFAt9GCRr2KP8cYVY/TcFeoj/COIFS7/5UC
	ZVq2CXclMQewM50xsgUQ/OvK2e5Fb2knRS9VYNCNh5rm/IKSkm+sIA7K1I/OZp4k9VjJTKLksph
	m7l7NDvoSF+hqkM5EOreYlowQWs0if9E8I6dj3zr+2zCL5+dj57Kk=
X-Received: by 2002:a05:7301:4d0b:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3537e0129e3mr26810675eec.2.1791895992551; Tue, 13 Oct 2026
 05:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
In-Reply-To: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 14:53:00 +0200
X-Gm-Features: AclHuK-P5U2ev9hpzeyozzfAgREhL2ZTBvoLRgkZb9RpskE9yERenkCCWIyQj54
Message-ID: <CANiq72mA6pTmPJUk8g7y3Z=wetFMXdzHLiPEPChpY4OTg3OHiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add Greybus Sotfsvc and UART Node drivers
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Markus Probst <markus.probst@posteo.de>, greybus-dev@lists.linaro.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:01=E2=80=AFPM Ayush Singh <ayush@beagleboard.org>=
 wrote:
>
> - I am not sure if Rust abstractions should have a seperate entry in
>   MAINTAINERS with me as the maintainer, or if they should just be added
>   to the respective subsystem entries.

This is up to the subsystem maintainers where the respective
abstractions may belong to. Some subsystems prefer to get a
co-maintainers for the entire subsystem (e.g. because they want help
with maintenance; see "M:" entries with "(RUST)"), others prefer to
have a sub-entry (sub-subsystem) where you would maintain the Rust
side (see e.g. entries' titles with "[RUST]"), others prefer to own
the Rust code, etc.

Then another question is how the patches should flow: some maintainers
may prefer to get a PR from you, others may prefer to take the patches
directly after you review them, etc.

I have some notes at:

  https://rust-for-linux.com/rust-kernel-policy#how-is-rust-introduced-in-a=
-subsystem

I hope that helps!

Cheers,
Miguel
