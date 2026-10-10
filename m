Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B237755C
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791671846; cv=pass; b=jeYhev7ng9QiPDky5Ekqnqvo5dagaCNcUjOvIXVzvTdXvF2Dnf/49W2zUf302HLJlCNcSG8CWLGOZxYjJU1BnGBDxA4XpKSi8n4bnFdGzCtuF8v927hJFXKIiwArXCaamzFP4ljClVTvsZppiiSH/GAiursWtECg7ZgrY9c6bb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791671846; c=relaxed/simple;
	bh=Edn/b7yHTs0QFZu4M/RBjveqNZ3qiAFmLJfm7m0vLn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhZzHTGU3i2RFH34s0OnOiREob40eH4F6QJ+nyNcinvDWxbuubdEc1Y4shdyhMl45Oonkgqe496iaE6OEm8SEjtaC5L6seTlLLpNMwDkqBPfXnDtENuh+k7QlnbR1MxUjanYHL5iITq+Qw2hinANHKePPI9qW03o7DBgALsj7S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=mQPVP+Bp; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mQPVP+Bp"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677af43eed4so625713d50.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 15:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791671844; cv=none;
        d=google.com; s=arc-20260327;
        b=jAEgJUJqkIZyoT6Vy4p6Yp0AYYHU5pv84slKJpG2wj+1psHYBK+eZa72X+hj+qa3Vt
         LnhyQKx+z4GdK2gy7RnZa+dGZldw6IMmKZvmIWDmLjAQ4jv6O5xVasowHQR2/kZBT6cB
         I/YoDZ0sKfI3tN+UJ9EfB+0Ko4bTTPYxoHWFtu3oRQm2c54Avvk3sWb6NJwJiL6HfRHe
         bL/sBHA9SC+fWIzkvXOGhneYodcfhUA8zahcNstD+ByqBnkocT7Q6lxlP7/kEcYoLSg9
         0wijLOxYhY5x484040aSSpZ4JSOkYX4K7Gz5Ow7NtMQ0ceyhPtmHdalqcL65E882ItBH
         tBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        fh=pFZgSqhJ3oaXqZH9NVqZhg+Itt0gehA563xtyQgRdic=;
        b=o3q4APIOxj9fqE55i2x9aQUrnwLcAQ8nPL5ZZ3ndczMjq+xXfD/g40e1M+xmWXajsI
         vTYNKbfw8PTvQE/zgB2bwq3xJpEQh1yTHX6ZJaDSipUMAWAsBLzJZaxWmDKTrRJgB7Rj
         ghcetCCoW8nLZd+2ylB5qiWQKVR+jdC3hJM0tTR2l+IT62rJlnHxXT0PoeDuHTADlEsG
         vtb8K8LDqAsJbPX/GB9QEFEvkmT4yotKHNeC8+DNs8hRiWwQPOfAm4+gV0WRoZuTG2Wr
         xQesu1+ZVqZhBfQZ2HTSopt9aVyyLHk3z5XLJq5HBm+zrKNbZNWAfXSVr/CQxlO+m8mm
         gQIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791671844; x=1792276644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=mQPVP+BprV4H0rZWB2FZDlYu6LTcaA8A7wu+OF1tcZUWLQVjN0+Gcs3eErEXTr/81e
         WPFvXfPMTIyI9I6yuKktuw4VkaFpZ7hZGaokdQ+XyUzGIAZoBx7/bwz/TTTTAhlFeBIs
         C3u+eFc6+Ljc6OkYA3XiJdkQnIfoxLlOZ4UFlolJwdi3T9LNVm7vcY4oebiNAvw9ctaD
         0DijPhUbOH5X2+5i/aS5MAOKGxRtTxlar6x2+16R58Vhoy8ND/cMl2//n5hybH1qZmGI
         ghfsm23tCFRGs7aucKptuQsxXycdlvWO/mtQIg6OqwWGyUY7m/hQS3tUKrnLooxQd032
         CSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791671844; x=1792276644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=b2Fa4NZhO0mm7QuBKkSHVxbI553rFJFRsXkRTm+zHPD5S7I8etvkpo6bODMHVu/JR5
         eas3zrXHIbHGHuP8ts+yDtg6KkY78BqdjWeLMVuNyVmRSauaXyu7qviNotFkVKYX4f7l
         n/49+5N60rsEaUZ/GdoQZ5Bt0/4HbRCEzHBUMkKpwKmWTkplOKSorG1zXL92DLO53Ye8
         zbcFoee3vilLB9g/TERIEBbU7kmt/me/YaIYsqzgkBANHmAqkzm0DHeeR7v9HzwA9uut
         vwbgRcAW7V12oRqWYGjwSgY7i6a/sjY7K3GV+WTejJ+/hBY6VPqqRjiUVOvf4UDMmCfJ
         ThIA==
X-Forwarded-Encrypted: i=1; AKwUvBxFKGHayROVvEuCaDQQXo9gdlVrFXPf9OpYsyTZPgTznwWlF66nbN3085h+g/292UIrWWjwXo5uuJOa@vger.kernel.org
X-Gm-Message-State: AFq9FYJD7UoSVq4+jYTWtdTFC6lUHkW2+VAZ+d80ZTqSueRgSONLPQvQ
	Ttp2rFz4bCJaJpT7UHt3n9Lw5fg0ao2DiLykf9nxWFzb8jLADqEhodchAceFV40f8BYGyOpdLRZ
	yykU0zbNXGsl95NG7pQ3COQu02dHxzd4=
X-Gm-Gg: AYBFou3r6HPzn/bbq8Rvhxe4bkAZflPflgLFDP/KRR5cyBuqaDQMqeHv3IPRMGOqL6b
	kFoPdlnTFr3y6UjUPo9wuFzL7LgHrA9kZ18aK0KFMzG6M22wisQM6zWIJsTJdZ4Qf5Ay0VOuVef
	jTAA0RwhFdkF2Z1Bnv/RPZU/ikS4gCUrWlYA5uOU2eYqa9WITQKZfWrTnDvGoTscKzQ8E2AFDE2
	+W1kHjkwRTltM28vVn9BOhLrp/C5qGT1e4y2EIjg8fSGoTfzzcQv9pxNsrkXUNS2UsWx4wa0jaJ
	DYABL0GpqR03e5/55L7ctr/oPUKOuK2mCVukl9odNsEUflmj3HffJHYwgHvk4UCARVFpoH6kGdl
	UzDvEtsb+MZcf
X-Received: by 2002:a05:690e:4813:b0:677:c63c:ed3f with SMTP id
 956f58d0204a3-67936a45e25mr1411453d50.69.1791671843883; Sat, 10 Oct 2026
 15:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-9-tanure@linux.com>
In-Reply-To: <20261010105900.247342-9-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:37:13 +0200
X-Gm-Features: AclHuK83tYlY1Yg4pW9pjFmYK85k4ljD0olzP_yaTJsbdkiweyuLFexiO6_OaD4
Message-ID: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew, Hi Lucas,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    =
RX delay
> +#   rgmii       -                     -                     PCB trace   =
PCB trace
> +#   rgmii-id    -                     -                     PHY         =
PHY
> +#   rgmii-id    present               -                     MAC         =
PHY
> +#   rgmii-id    -                     present               PHY         =
MAC
> +#   rgmii-id    present               present               MAC         =
MAC
> +#   rgmii-txid  -                     -                     PHY         =
PCB trace
> +#   rgmii-txid  present               -                     MAC         =
PCB trace
> +#   rgmii-rxid  -                     -                     PCB trace   =
PHY
> +#   rgmii-rxid  -                     present               PCB trace   =
MAC
We have some boards where the PCB traces result in part (1200ps) of
the delay needed for RGMII (2000ps).
The remainder (800ps) has to be added by either PHY or MAC: the
(RTL8211F) PHY can only generate 0 or 2000ps delay so the MAC has to
take over.
For the three boards I have in mind, please see $ git grep
rx-internal-delay-ps arch/arm64/boot/dts/amlogic/

> +# A property for a clock the PCB already delays is not in this table.
Can you please explain this sentence (I'm not a native English speaker)?
How I interpret the sentence: The PCB may add delays but those are
implicit and not part of the {rx,tx}-internal-delay-ps properties. If
the delays added by the PCB don't cover the full 2ns requirement then
either MAC or PHY need to add the remainder, see fine-tuning below.

> +# It is either the fine tuning described next, or a mistake the MAC
> +# should report as a fatal error.
How can I differentiate between "fine tuning" and "mistake"?


Best regards,
Martin
