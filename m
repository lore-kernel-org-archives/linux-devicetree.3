Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0740244A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834403; cv=pass; b=RTXwUVXNfxn6xtdXLrj/SaioHJDn3sk2Qs0wotFzUSQ2vr6cplRuHKva0Ib1x1XRBM8anBb8iYES5PD+sk7Rao4k0BB/DudyF9EOvCOSWCnFajqn+9SyYG6xTsFEStgw1r4RN7KUAB+1j912IppS3a0D0VKGlCU5EPehq017yh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834403; c=relaxed/simple;
	bh=1lcRrzpWt3IYTyxqjcwZ50t5ZeMwNrUNQTJrko/WnXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqdBn6sqVDFVBrt91OaUlij8cX5tkTswO+sTIigGdHRsbkpVDjs0ZHJLJL3za9IEDyriIBakM61q3jquOYNpJMyNE9xuguFIw7Oq1NpXwgbGnSga7kaHmcJNC3XD+FQpbPrUXgmSeKow4B+xxMDK4Vaz3uO6yGTUpEksIQPnE8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is7nxtqS; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is7nxtqS"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so21214019eec.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834401; cv=none;
        d=google.com; s=arc-20240605;
        b=eqKi4ehPIVDSZlQmK3PzV3BmO3o8vpfrp7GUTx0hDYcFjRdwaU12+R3/n38Ct4xvPN
         /3N1ylHYE8fvS4TLYOeDLxDbnSqWZ/ql8inZd3WuP6gSuw/TJOozWVJHhKPEv5Sb3Qo2
         fLURunbyWDQ5VO4qcuvNDxWIJkn2KBU9nvNcijG+9N6FEkyVgksaVWZA6TbnkksYzx/n
         wVfKPJrPAXUKJ6I5S+0agx9teXu22oERXS3XXXxb9KfXjrpuubkWmpX9p8OCJzaTjER3
         6XBg81G7UE5EdArn98KtWtLN6+VPD3GFcWN682PI3gSGq3hO3Tln3gut70i5mNkXt3Ls
         HRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        fh=wJbizb9kN/CyQto54G0MI3LiaO+fhT0pC5oL8Rkbw4o=;
        b=OLlfJPgrVrkhTp9a/v9wpgtMfLUu233Tq4RKpKXTNVTYBpbFk8iv3TPiuIs+WcWcQv
         BQ5YzLFVTBP0+GKyUyM5Jq9PHia4OkGb6NTo64vVzYbcs+6Fj9OIt4m/I3y8yt6FKP6U
         WAvi+g8up5sWZCWF2kiYaZX2habybi9OE4ZTnNFhokVccETJZUCrTXKv5Vdy0Wc3w4hC
         hcZKldkrDcN/Zwu/VmVQoME7FpRYmKTrwU8zvoYSbjzbvmsPCwueVS+9J1zKcmEIAHxD
         Vj/RQyn8B5vBI3AmJVZ99Nzn0AYgloKC6cWs0t2Er2xlWXqfRpk+KnwkCfGse5hTbMnj
         LdNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834401; x=1779439201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        b=is7nxtqSJzzSE1pIDEQia6X3GSzhFzuBSbS/XUZb/kHd9ERKtuHxKogbrcbJ5GUkNb
         27AYr1G27EkQ/WlQHWkPcWk2sgv7RHeoHkgM+jgiesZPmndMf74tJLUystiYEsPOZzKD
         qrwZhTSICUW9/gXkg6p1bOgYxNGHV92nIorQQcCQWMBs1/nZhbrAiTrh2aNY+vM1rw6G
         h8t0tOp3nMEY5qcXy1+28v2lA+/X2h4SOFTWUc0ML8oTxj5RFr4AOr6hkQDAXy9a4xgo
         B2GTvjziYm5MskgdWfnkp8O3gC+dXWdS72lkrkG0+s+MeyOr1XEWdqzofVqak63doJda
         qAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834401; x=1779439201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        b=czrUKqPdwtwmp+CwTV0b5jXt9brwFo0x5kHU4Y9OHlsM5FYrtGfQghbN/bDwLkncm9
         bjxFL7L4V/6GNA+2caMVNduhcyBBGS0QrdTXXfKreYknJjfVLERIITnvWdwzzJ8SWmaK
         S8cS16Fb2RHWIdaJS5ZZmtpDHHisfLeEm5QDHGBIB/il7odXqTxUd1tyD/lkBf4biv1t
         c1uez0k8dNDHjMcr5y+6cV90U0S8MhyW/EuqaDWO8dlD2snm2AhUO5eWi+7E66cPX3fb
         rcueCgBufLS3xKN51Av1Q1Rc94FlUX7UnFKjJ59GLTSgG1+Qqu2NHerq9fS3IEjPI2yy
         FhLw==
X-Forwarded-Encrypted: i=1; AFNElJ9GMjH9iBxwloJ/h4c+e1uh1QzTrx9p6yCtbnGtN0kFpQxQLYuMRIdQ6eAcYiEh5d3B5Yub0fWTLMCE@vger.kernel.org
X-Gm-Message-State: AOJu0YzmSCe4mif7coZVkh4TN1st3uaNAaJesUp/vJRwP09Po2P2r6Lt
	TxAiaAQAbUSWdPtDtzW500R4e8k21WO0r8LmJAPLe0lZQurGbmJHJiPSfpDyVNM8JALZnsDiWfl
	KAcxocwUsbsW/jLeBajqcNdh1IfKFo2A=
X-Gm-Gg: Acq92OGG2AWEuZxx2bNBLthBEdylcZCt+6SIYQj6gny8TKdfZHreE+HYmP5TlXUsRTG
	SLWQVK8/ps1g1pl6PBLI0sAEuiOBXDX8T6q73ISjVl/XlZ8m3zMP8IJbYUpO9qqPNEKQUqyzRXa
	RooT2ocjUlbMMXhA1NDiPLZ0hILDKKB50WqMNHQEa2770HupfiZbgIsvOK6U2/U6O/cFWwiLUML
	0AWMOA94/HnSZHoVoQuCSgbY78/T/mcOrxwNZSHJOHDPIhnPjiA3SAssvvusIH7xckV8ETOIuQo
	xX7rnfOt3YuIQMlAXiw=
X-Received: by 2002:a05:7300:a504:b0:2e5:8ec2:82c9 with SMTP id
 5a478bee46e88-303986a15f3mr1535796eec.26.1778834400799; Fri, 15 May 2026
 01:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-4-clamor95@gmail.com>
 <20260515-precious-ginger-lori-d1fde7@quoll>
In-Reply-To: <20260515-precious-ginger-lori-d1fde7@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 15 May 2026 11:39:49 +0300
X-Gm-Features: AVHnY4LhmWA2BwD0V1_j_6xstdiR56JxjkYZue9zoJ3Q1jLukX8MObrLmKvfP2I
Message-ID: <CAPVz0n3mvBLracMWGNuJ8kKUvAVZ+JRTJVkZGyq5MkuSobd8NQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: net: Document Infineon/Intel XMM6260 modem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 15 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:1=
8 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 11, 2026 at 04:56:58PM +0300, Svyatoslav Ryhel wrote:
> > +  ap-wake-gpios:
> > +    description: GPIO connected to the EINT3 pin
> > +    maxItems: 1
> > +
> > +  cp-wake-gpios:
> > +    description: GPIO connected to the EINT2 pin
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  vbat-supply:
> > +    description: Supply connected to the VBAT lines.
>
> This should be rather name of the pin on this device, not the provider
> name. VBAT suggests the latter. Please double check.
>

There is no documentation on this device from Infineon, I have used
schematics of the P895 where this modem is used. According to it power
supply is connected to pin with name VBAT (and yes, I am not mixing it
up since supplies have different names)

> Rest looks fine, with respect to Sashiko comment on description:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
