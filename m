Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793950004;
	b=XpM+j43CdMrOmhn+Gza/dkQ8yDLl4WEqj+s/KtHEDRS2/nxs2Ki9wvLEfk0bnkIv1Xc8
	 EFtH83UC/H9U6fbnvX24XNkn73YLX2IHaQHxqUmdYe8wYozzconR92VfMhP15V431p2Ok
	 U4FCxUI+iXvLHAN/jYTa4X9GDWwNI64aJNlhJKGrjn0CE4kwsHMOfDJKMzktvKvvTxXwo
	 cHirCYMyTXmCQk4w5n13G0jwTAmFrfhRfD8n0Udeehnypx9o+nA1ePqQY8cMnbOQ60g8m
	 pt7oAYkg+HkEgjSpmP1YC8yhzYlKYD0eEkSnS9E9vnW9mGGbKzejF9QX4ERBdNECuOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
	b=Y47AzMgyW1/lUYEV/O/jrIZfKsOWKTiIM3U+oxPAQ0gPOwMClDm3RIZBl84AP0TAadrZ
	 teySwgfKWtlk26eUWtSrRE6WfLdJ/g9OGxAiGf0ZdD2rwBZQqVcIv/yVUqcOClJ8mNO94
	 spFXPmOPhqK32OYLBn1d++V2V7V2H8IeuzhO7D/vtS6MRH97/jD8+MLLqbym3IIpRdtPS
	 JkJ+0rSG1abx3rUNUDKsAYfzHXGRD5b7tUre1TBCZIu1KgUsTuqQb87/IIZeJKe2IFzGX
	 n7Bc850I9R1zaOdP4e+mo1Sw0n3xU9axK8E6j7oMJEcNj+XieHK6LZQdP34+1utOO7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i43l9L3s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08B7606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 07:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i43l9L3s
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso13550271fa.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 23:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793950002; cv=none;
        d=google.com; s=arc-20260327;
        b=Jt2aymOUV4f1hp/sD55DWBV5roXCObdju30tnsPG/KB2DzaFWyDd+elnUGFZ+vKqJM
         +s1zH1ybMVsxFjdGUk1LSolnB5xX8UyNwdproBZrXpetycMdWILFePF6/HEHYv0xIrRH
         J9Tsht3nQUCdwzSKSDHN/sXfJciGKd4OLujSeqWbXAhkThCacrDVxXDX49WmhySyrcNu
         uzW2dFtfu2ZwcgjKaRs6jS+Qehswe2iH4efcBQK0Qb6DfE2kVHBpGJFpScUw+X68kSG6
         yKJeWvQlrMreh8uuyAJg8zdV7Rust3Ot49ZCqGU8J6J/92yN6b0UKkugrlgAMdYU3iRL
         aQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
        fh=1yW7ozVDjgxXPk5qpp/X5yHbwJRUfYpGy+emH0jTnk4=;
        b=tAwOSG7/vtJQoOEiT8aVOHiURSEhZINX59KSoznjFihaOCDMuPtIoE9ZH8DISQJN+h
         tr7z1z5N5WmZkAwAPvozNTA/Hc1xQ6FyIq0mueNk7dqRPlwXZzOW/kuWq4nT4zxuPlix
         oFoA0/DCisHIjxEXNMRT7hEswi6sPvkvedK3QW+BbcZ8bLKGcNba3hmCCiX6ufjPz9IU
         kyCIWaDWg3XraluukMPbYT1tVdWdW3ewp7Xuak7vi8pOxqxJ/ugUBuJlCJHQAPVp3Dn4
         XFHsB2pVHfms67C1SZ3ObGohYdKlZhDHrebCQ6nb1HDKVbs0bw0+2prxURjNRNRbaamq
         KGeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793950002; x=1794554802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
        b=i43l9L3sQspG6oUeZ0ovsW/UEnjQMYiJ2YHwoeSoXECunHxmAqTKwDZyOFzu61cVIw
         UXEKybbQImGj3Omb+XVTxJMP/S51I1RCBuXisIz6Svvx3nV8SWQiYx9J494g1nC2NbwX
         BHQuka3pkMow+6xEQCba7PEajwoqbFs/06SNDPrnoUSdiMk9/jZ2ICRipSDTHmXKSBiT
         vE2ygQ0ViotXloj3UGLFNq6/Ya6kKT1jBjtwRHEmDDJHxnKLeNQYUPZqD7ywpQaQuNXW
         SfC07CzHEVjl/cnz89KyPbNOu78WoYi2+zeEgtqKzkAPTsJ+W/T/6M841vi78YJVEJHA
         PZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950002; x=1794554802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
        b=TqsnNWaEITdfsC470R2ldJ9XCSqij5JF2j2bTmzwwcp3YLC2ZMKj5DLk18aL32ATjL
         Cf95k4a0VgMtBSB8ItrdOBJMswSkDFQPM0js0xeC8idygJvmlztKLMbtBXjlHjhoL4zG
         S81Kd9tWbSlF7N9i9iUHGBwQg3EaC6Dnl5CGyGJSAzDnZ8Pn7ElcFuT9V8GbxMLyW+dv
         2eB6MVUzEeVjr5KrRxmJrzLk5UFPrpYThF5NN9DWVu3zoqxK/hWPmNW/gGTHlIon6dIv
         m7TIKUTskgRZSHQe/vaGAS2A391sYOqoLQyEhZEw7+PHK96He5j4p5x7Mo84w+c0S1i3
         HvSw==
X-Forwarded-Encrypted: i=1; AKwUvBxBy75DbMSE2Ciws2VP9o6VXTp5USFskGiJQbFSzxZIsbERBopKGqS/JzZdWIoZkq0ziUb7ocUy3zxb@vger.kernel.org
X-Gm-Message-State: APuU4Z+ooVR+Gskac7DTQnzwXO8LPu0CYGDTKUgvsqptHOgvEOphJybr
	dMXfVb4U881mH4mu5FZSARywt+M0g140z63gKgeIjIFiNPVv3dyG8xlB5IhFjJS8E58nNoBHqWb
	fwLT3Uq0cvYv1TZajLZvrkOuUvhUY61M=
X-Gm-Gg: AYBFou0bHUoIp4ImhumzE7/bKVN9lIbzMsejb1h5c9OWI7VorVZfVZfB70BzMFA06Wt
	vrUvlLc3FbldeByeLKje7D9B4H/mwGcmQc017WJ7gU0Br97v3A7ZM/nmoWugcQnbUfdb0GQ8NNu
	M1OCV8C72SDMKkXXZSD/AgaJMoT2FsS+Zk5RiSTUsD2muNjMQuat0aZ88EZT3ZTaqAdP3rCbRp8
	UULaY0JBTuAsckZtgA5zXNGBt64KGnsj4bFu6alL+m2Kvj9fejeDBxw8OPv4/w+/EelvYObGE8t
	0kVasWh0U72EekyQUWp7uGGoMKbhg4gCWL//UNu5Y4DRk04REeGgIJ6Lmi8TPbR7vkdoJMzoUnx
	51XPd8qazQCYa4n3fVYRN+JokiVgNAq5CvwvqSMiHnE6YELrewYB3ZrQWag==
X-Received: by 2002:a05:651c:888:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3acf3b31029mr2910091fa.12.1793950001835; Thu, 05 Nov 2026
 23:26:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030013135.158157-1-dc_redstone@outlook.com>
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
From: Stone Red <redstone.dcity@gmail.com>
Date: Fri, 6 Nov 2026 15:26:30 +0800
X-Gm-Features: AclHuK8OgaKc8ovDjTSMAgYe8ZcFtMznJBsRB4oxNpwujlSQyHmW4Mmsqhs97-o
Message-ID: <CALkEBsx4z+5tbxEerC2M4uNmG-UnOsy8mvYdTgQevh_=+4keqw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
To: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	ShiTou Hong <dc_redstone@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, how's it going? :D

ShiTou Hong <redstone.dcity@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=94 09:32=E5=86=99=E9=81=93=EF=BC=9A
>
> This series enables additional peripherals on the Qualcomm SM8250 HDK.
>
> It wires up the SDHC2 controller, the LT9611UXC HDMI bridge, the FSA4480
> USB-C protocol chip, the PCIe ports, QCA6390 Wi-Fi/BT support, and the
> PM8150B LEDs in the SM8250 HDK device tree.
>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---
> Changes in v3:
> - Move the omitted `status` properties to the end of the nodes
> - Reordered the root nodes alphabetically which were also omitted in v2.
>
> Link to v2: https://lore.kernel.org/all/20261027080758.3990418-7-dc_redst=
one@outlook.com/
>
> Changes in v2:
> - Add a cover letter to the patch series.
> - Reordered nodes alphabetically
> - Drop `output-low` and `output-high` properties of the LT9611UXC pinctrl=
 node.
> - Move the `status` properties to the end of the nodes.
>
> Link to v1: https://lore.kernel.org/all/20261023072832.2642647-6-dc_redst=
one@outlook.com/
> ---
>
> ShiTou Hong (6):
>   arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
>   arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
>   arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
>   arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
>   arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
>   arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
>
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 460 +++++++++++++++++++++++-
>  1 file changed, 444 insertions(+), 16 deletions(-)
>
> --
> 2.47.3
>
