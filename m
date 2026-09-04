Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609723932FF
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524890; cv=none; b=AMecxcZeb1DmC5kzT1nh0TJGo2mkE0liYgSdh0h7KJCVCKkosPzENID5iEocIDP0J5R2QR0sFizEWt6iLBc92NcEp+NqjMjCfRuoEO9nu3Xlq6/x+8KeWtcVhdWLT9XtvJ4N5VGPfjpISsTocAJjzHG4gDE+nyOs0IZQP2kVVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524890; c=relaxed/simple;
	bh=vjaQgjeSeDSWekFLIKX6/r8ecgd8zwyE1GwfTXL4Nb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izjWc65ObpWZhNqAjYar0L0sW1U/7F7kfn31EchoTOUDLR7EhyLgq7QkVEvDOzHhmHuDks+mcqCPPxBQIW9N/uET1TsppHysejSX9dBhpuET7XCb8UhoV/iAjMdguLHdBYEv0RLm/7EGJQ0I2eJN6oY1OCSkWDjhpXucuOCfk08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-85c9a79590aso961115b3a.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524889; x=1789129689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mDtuYgjcDY/xg58xIH9H2reGhfYioaWqgEAldYn7pM=;
        b=AdY/llf8/4Vu+uUmncZ0p2ZdKWp0I15dMEXkBbLSc2tCejh2dCy1Ar3U4eF0DPJSBd
         uQw/dCPv9xam9Gqrzxi427gxN6LOde/TkuJeCytFG0M5L2n8vWNzESewaG4rP3Bea37H
         55dOipMtOisHx9bu0Ln0zJbY/XcC86ME9caSYP6KI2+JHrJW4OxR84OtGj0aIC6uk7Hz
         MmzA9m//At9qOu/E2uyR5VUGi6IDhGuMEtraFe+E9BHY1viiw1MtKUot1hsQIJ9jqDpr
         YRBNVkMzCLIqxhu7cBieftkVDcICHlNGl010VkDMtbVB8sQ6meOZTHJg1ZMYCMjSNqH3
         CZIA==
X-Forwarded-Encrypted: i=1; AKwUvBybrFfCRf8r6TpuGZD6g2H5R5E4gGjJ5U3sua6b6kAuCx+U5lDu1C/nTW7UChxwllsaifX6Gp9RV43i@vger.kernel.org
X-Gm-Message-State: AFuF++kN7pWjfAKcbhMQMJaK/XFWo4U2ewHTMTFnbUxs4LRfe0z2UInx
	3T3abBimfA95sYwrGNtndUIJ1lk4DgtYjP84HFdM91ihKMh2nQquMp7sr0F+mjn1BO8=
X-Gm-Gg: AYBFou1U9idsgkC6QoBD2I9GMHPSfFS+RoPu7KYDRNSa1htDflHQOrVL7Kyp44MAzrJ
	w1M1WzPqKzD28R17Ocu9T2K/PtfTWomIkIY9zwVIF7QIlkbDh/26DiPmXsRVYBQZi2HM8cXEO/u
	03SWBvEjHf7LEAOXw5dUaGXQMSBEX9fraOgjLEdMGvfoYJrEDxzwOttUY9FNABlzXxaE2sjnHcX
	kublcP2e6jJoEEbPAXZEqqwLpufw0VDf8SfSaC6rNZn3lh7PNQ77xpTej55wOFvU8RsTNJyGjPp
	P+GPOJa8JaMz5eOtD7Fv8vV3VSQOCmbiHVPQN7xgvUBinbY1czyEZ9a54m64L3KuuGn2axOmR49
	BqTtmOG89Hr4Q3zp+KIXmDs4cemPBvQ+rMnPqZmVbYTpu3lNTgyxJkGaa5RSKKHLMhUyvX8LBfN
	+m6xmnMgaWANapsmRbpI9eGwv06bDhDHP0sNi4AaejkMcjf1r/xMHxE3TxPmGz9F6VDYoUXcH1Z
	7Rs5JUB7hVUGQMzgiiqUUIcF0vc5w==
X-Received: by 2002:a05:6a00:908f:b0:84f:3f5e:f072 with SMTP id d2e1a72fcca58-86168b90c31mr8784457b3a.10.1788524888492;
        Fri, 04 Sep 2026 05:28:08 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045e8dsm1083081b3a.20.2026.09.04.05.28.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:28:08 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-85c9a79590aso961104b3a.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjee35XMcv8um2+oOBcpk+FuD0GN1TfE4WQNRMSjnahVi7WfVb2huneLy7rMWcsLt0ylFYOu7GHPwS@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr1483195137.9.1788524549478; Fri, 04 Sep 2026
 05:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:22:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
X-Gm-Features: AcwNN1VOyxrsSm03PmZn55Uovue1s6XEkpvSES0-J6cXzlUAe5_K8yXLbqCQsDU
Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> The list of allowed pinconf properties already includes input-enable and
> output-enable, but omits their -disable counterparts.
>
> Each pair controls the same bit. Where enable (set) is supported so is
> disable (clear).
>
> Add input-disable and output-disable to the list.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
