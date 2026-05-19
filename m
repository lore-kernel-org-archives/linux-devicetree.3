Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779331EEA49
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157831; cv=pass; b=gaezvsNwFSN4TrNYCdZ1aVtwsP1VvXcZ+RfCRr4RUPFJuV2+LHCdo/8dgf//oY6009ZIZXMRncwsKuSF+sR/9Jhh5jEwpJdtzQUEXAFdcp8uhh+clCs8sib2FSAqB52iHa6HW+dvq7ByfyBPUF/OHGvLyAgMQ0SYLQWMIABinPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157831; c=relaxed/simple;
	bh=n6s4RgbxvGYQ1bpx0m7iLtbbh82PRIO4WHvfO4BJd8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aePhPx8nJJ3/ImVzD7uA5JvhwaH/ap9poftIZ4UbnM1/pOOB0n0ozFKWzZvOdW/iE2hUgqCZWOAKSSFg3nOvfRV04fquaMd0GvSEThRrH/7k6hMcL8ejCt1v5vYqIzCMJLMlh+qFe+xQ+/G6+QY/+sSLeBpI7DVABgHMPFqPO3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn8tRW9L; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn8tRW9L"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c1ba7eeb6so3067274d50.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 19:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779157829; cv=none;
        d=google.com; s=arc-20240605;
        b=HIgOzHdxkdOqTVCgspu7IeyNS45yy0GCVZy8VrbwEp+rBt6CFG+jYz5G1afYCuy5Hm
         YblQwPjxGzhfEhA2xCV3jQnGxT5x5R52t/6ptu3dD0wdVQCThCWN8O4iCCgvSxoaJ9ps
         fU8EVHBJxlzMq50p+PV9hz5XayZYc/UxkafMmB2z3hMr2QfI1rLRHsrLOrWFrXgwjrZu
         5HcYpbRp3JQ/A4kpFwcZhf6FuhY+oc1KVsnbhnf3eMgRvaCraDtp7G2KO4UBBi0j4Ko4
         AP+z8VFEgGAB5pKXlhes4GCZvH5JX+o0UgNj+22Hk7sddkasH8yNHcgZHGk8LfTLNbn5
         Sz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VdLnXWkJlod6GBXC4HreIgrL/kJTqIvIXNwxAsiN18E=;
        fh=1d35Prv+KAWy2c3LeEYFvJvGAUy6iKZ3FZr1l13r4bE=;
        b=BKXKOdWWB+DY50nBZA0Ic20Pio7OuIFwTSJfC8OSmhOksQWQG3GiEQ9J3wlt+Cx0ph
         JVwLoPUNmne4KTCvAzqWWdtXfuGetMwdzDifH5DJMZZ6KKqEykyls48+KtJaUxq+1tzJ
         shOSdMD7lxhx9PA4xCl8JEx0uJE0BPCPo1h9bgSFwN9falgQ5xcQxu1ViuKN78Dhm60o
         1xEv4gbsddB1obhYJNh7wLFWqrqxVdOHRgwgl+eqCGoJ/HkcI57wjdzpMPNr9zzRElqM
         l9YS8kZT/zqVP4SpjrO1IsOghRdSa1kYr6ePXy3N6nxoTd4xNpSeVox8F9HjIJ+WMJcj
         Qfjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779157829; x=1779762629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdLnXWkJlod6GBXC4HreIgrL/kJTqIvIXNwxAsiN18E=;
        b=Rn8tRW9LMioZ6sGo2qAVnARCW8fUKQgAwNUTUQhugyYqlFfoHmv8HKv7qHKZp37KKH
         g3A5ivJsz0oN8MVqxvpPDZbMUNlz96LwbuYuv11ny+J8SZfb0Gv7PEU05OXvniv9lAfa
         nFloo7mJ3rj7DPaRoHGV9PyF4YSOLEzLOhpIHt7O4wurH4uDpykOCSXBl1IMiLpjxcOH
         uDeqNU03TaecpY1EGfQrfjsQ+ZAVVkC5iD9dBh11dTkg1yMjvUBT/7J8plWcfqvAmrzz
         I5Zv+vhevJIgRRn7RzZsHQxAwWovJph0sNzqBKDXh3hyEPm7V5H3zNEP5KYZi4fhSPjs
         mocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779157829; x=1779762629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdLnXWkJlod6GBXC4HreIgrL/kJTqIvIXNwxAsiN18E=;
        b=Riv4kY+CPgaWQq3ME88NHU5/z2ph5D3pJaRlt+kxh9V3y14B/30iMPVqu+zfHAllDS
         Pizs74d4HybeFuNgsDWb/erJniVK8RZb9kh4TCUp09KB7wohLfmAOPpV5wUfurGrLx1d
         rTBMpNyoRM66Eq/OpL+JX2zL2btVPh1yT7xcW4XjBz34VP5RkRYIKi7RtwYpmVrKhv1F
         TNXDV7wHH5Dwbzan7cykUJlj1QSOeGlA4YA1O3DAbW0Hzq2UKj5VhT/5xGxw02ZuwGX+
         E3+Aa39cHNLrJknWEsQ9nsySbrcvsqaKBNn/jz8gPrXoXJQ7sD8j1eEyDcYe1Bqe/UsH
         mxsw==
X-Forwarded-Encrypted: i=1; AFNElJ/C0p5yFLwhhuNReLACh4+LYqybO6j0+o1c+jwwPQ5rUqxwsnbBYYwXahlRKYYHEaVoTRIVTqo3yYrD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbc5HXgdDVoP4NuKP5gdEoS1akOuToS0CmfKdFMVVf6LfW/I7e
	Qn6eqQf0Vl9lVznWO9OxRD43PI4TqE/yNq4sOIYK0t3mZ+7Hc3b9CGNudvnL1Qr32Ktq7ZEaYVi
	eTdMgiOP3RiCbt3chArZXo/3B6QD06ys=
X-Gm-Gg: Acq92OFuDB7qw/SlFeI+A4KjZ+MFPQAkabXIlL0MZNujyMsH83xLlZ3QrCA+jLv6QMu
	VMf0kTZXEQYRX9KOoovo3iyMDmRX6XUiLS6q8cxjbgFdVpv/CWSJUBJ7tOrGiGlxdmiMBqqseBq
	NVkwJCG+/IG8GmfAkUUs3CDBhjfk7iZ0qNx5BpTXg2q9JylKdyU3MQRcPvC8mOOENeW7veiucAq
	eIvylUz1XNAV4uoBC+X5eCzqaMlKW7JC9oU6lqepdoQnDRznc+qUwxBOS8d8zg9ogp3WiycTF1f
	DnhelTBR
X-Received: by 2002:a53:acc3:0:20b0:64e:a9a1:fdb9 with SMTP id
 956f58d0204a3-65e227fa1cemr14329495d50.34.1779157829471; Mon, 18 May 2026
 19:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
 <20260518033440.17569-3-prasanth.padarthi10@gmail.com> <ddb781dd-e117-4f9a-a5a3-94c192d8c2ef@lunn.ch>
In-Reply-To: <ddb781dd-e117-4f9a-a5a3-94c192d8c2ef@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 19 May 2026 08:00:18 +0530
X-Gm-Features: AVHnY4JaeDtUFpVTlb85c0qbNvo1Pm4Tax_KEyAn6qJ236xPn2YUFjmk-qtw3Ac
Message-ID: <CAMFFDGjg-ZscFf8g_6=rkCeZ6L7M+hEsBnD76Lb+sGaStWQ7ug@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Understood. I will not rely only on the vendor DTB value for this.

For the next revision, I will drop rgmii-rxid and use the conservative
rgmii setting unless I can provide board-level evidence that the
required RGMII delay is added by the PCB/PHY configuration.

I am arranging hardware validation for this board, and I will update
the Ethernet node only with evidence from the board/manual/logs.

Thanks,
Prasanth



On Mon, May 18, 2026 at 5:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&mac0 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rgmii-rxid";
>
> It does not matter if this is what the vendor does, it is still wrong,
> unless you can show the PCB is adding the delay.
>
>    Andrew
