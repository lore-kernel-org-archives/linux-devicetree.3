Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA13845CB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130906; cv=pass; b=hb1c7sR9Xf/TNH22KrhaJ+dFePODE5DmOdIciZuzSyNJF72W1gRjliVA7hr6aG79u0yt8JHl2n4ebVtX0MrnrRkmGffyv1d3HnKUGxasuy6pzExz3KaHHWU+nSnQBoaKZ7O3dhW08QPHedfV2eHBdOg8GHiQ+d27TGnP6kppOss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130906; c=relaxed/simple;
	bh=q5fsOrXGhxde28Ng5nH7s2q2cj/2S9OdaUOtLf7SRXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7vDRKfXlU6HVCGF9VlOCvAPyjYCIgM53MG/Tl7Y7LlqlpgyFbKA3LreYhF9WpQYb1yn8CGufVB/+i1Ox3h6/IR0z8YqSxSVwBJm281pBZLZfwLQEP9Z/DDPqLcVX2GZnHqX7brB57vyqc4/ijPVZfc/J6olRiyqVvlGN9u/3h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBByPPTM; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBByPPTM"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e568ab0bc5so3072884a34.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130899; cv=none;
        d=google.com; s=arc-20240605;
        b=bmTMX/PCv/UG1lddo9XbjDWRNx/pXCJeMNgJ5I+xCPxR0udBh/UXh8n381HeXvutw/
         OHRiU4743bFP0vAze1DqbBrvmQt1EyijII0GNAAeJgswSZyHHDJ8Ql4lfhHSw9QJYUFH
         lmOE/hf3ItPUcbmz6oJn95L04541/UQKsC7SIvZ/2Hh3obETV2eCPsXPYWbiYt4mJ7cA
         ErHn1bQrRfLk8TXkychoXjdBkTImkF1ZkCB6ipY21UPLjAOVdg4KrB2ir09Wgp4lvulI
         QIdWT02wPIIEy5SuqgH+efmgLc7Tl4iAErbwfWi6g9flNXMT2Pjg7f4waNFzlZdPeEwW
         uESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        fh=9yAv8Zbcmw/nKnOAir5xSf7gNe27XruDHpw3BMMV4b8=;
        b=FY/zC/v8JeH/wLgcz11lC+JmSboCoKs1nemkGzG419ft8IV5ZYPALyMJHNOupTETpr
         ep0vVxbgFSs5kL/+ji5SU7533eE7A93L1szM6vOandUxRNCaZvtSSSH5hBW+8K/B44ga
         AkfTs0fE0pOq6Yh8gpjKKepy0HQewYL0U34mYYPSJabAYz4R7EyzIKVjreDvltl2Kk4Q
         TIrQ53TTJjJoldf1zxG3395ytkg/vP62ZhEU2VrQuuJ7vK5GTW0XMqTNCW2MZ3azFWEM
         O561I46zBwP/YvFgMxoVcpg9sxhVTfKaaoq2ORWnrTZ1OHxZnjP//ZXsViQ7vcw5lRYW
         d67Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130899; x=1779735699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        b=IBByPPTM2bzIt7wrqQQNCUnx6tILmqk+l+vruCUIWAZN3O+ZjNIxtOXaqyWkYzwSfj
         WVSL4kugKeixsc92z85kCXLqdVp1X7eqjjgeoXfQid4ExUynrk1mYMHxqFUktJBx86O8
         UfNMnCWbXPxDK+Lkt2+AMGlxEuBxnQ+qsHu+BggxWdctDhRRZJY1/HzRcl2GhPxjqc8N
         4d5W2xIMZ7i4hhff8Lr88uLEzqQzvarUvyQfKSskuCapfYlCxZEtXViZRwAkIbqGAx9Q
         eL2tJsXmqJdaU6aKwueAnX/VSaeoDRcgn/FTmshbh94UViUreUgJdIn9dWDVvsMNvoL9
         LWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130899; x=1779735699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        b=f/F1lGBal0zCfhxxxx/K+a/ccodhp0/+bwG/kFTY98nLMX9uij5h4cen8XClWJdN2v
         IMx8wEtSQbF7/JCmib6erJ3BNRVvKldjOk5G59BNa12u+uLFLiMsTwp0M6KV0PgKeWS1
         2Yq1YRfLrVoRPc6GOhdxvy8LXWcPRkATSZLj7mVBQUHyXMC+9iu8133ikHAhjBLmK82B
         AI1HXIxShYzhha/fVZmxl/+5o41gBpbVhNOl7b0dSMJJQTr84lTP8jOVJaQH6Tpqf8bA
         kLqvJAtlppWPnmshegEtWJQuSl1PlmkxiI+Kr0w6D5aGV36VOdVTOOzXLF/ajGRTLroX
         HhUw==
X-Forwarded-Encrypted: i=1; AFNElJ8n87Jt33vFCvGHEp41BS9q+qBvR2hOMbOQWVvv8wxS0MJxR729w7r8XiH/bXCon1GuYfGtaKoAuGZE@vger.kernel.org
X-Gm-Message-State: AOJu0YwuLv3TJbBgO72+zBrMAmygdG6GjUm5Uv3+WvdNH9onWPTGo6AM
	YAqMsfCClV32gGccvX4fGMEj3e9avKss3HfyoqKfAezIZJyAGKrbgystV0EX9qKLOEGxlNIHF1C
	HXDNnYrpa58nHaHVZaU0rn+6yXlUFWgI=
X-Gm-Gg: Acq92OG5jRVEpCNbw7ZrvY7wOB9zlgS7gdpuQBhgAnOut3lc+BKcnxGkeqq0wIiOR1j
	tBfAGGanpEeqU1vQb5SYatloMY3Rapi75mj1YX4ksYcoYqe6rbLb6e02uQuj64Fi9fMePFY47bg
	2pLI3e6Lz10oqmWVmYduGUZgfcykIIGbm7x+kbqBxggFbWlJkF9rzk0apTz1O5msNGbRW0HHtWJ
	r3ewqjvayOlc6FuM9Rh6y3eKdB91T19ifQ7rJ+XewB9pnpfQz16RdyEdEZIa3hU1aBfBrtP2P/N
	08cBOvbL
X-Received: by 2002:a05:6830:6d12:b0:7de:c870:46d4 with SMTP id
 46e09a7af769-7e3f0b985c0mr12318672a34.1.1779130899540; Mon, 18 May 2026
 12:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:01:28 -0500
X-Gm-Features: AVHnY4Jfqq31qxvmvcr3xUG2xmBWlVIWhUqOAw0XC6IIO55JZbxmx0VMm7oaQS8
Message-ID: <CABb+yY1CusV7QFdMGQOTb0YjR1mRHdp5MAZPL5fsimxB52_Y4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mailbox: qcom: Add Shikra APCS compatible
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 5:41=E2=80=AFAM Sneh Mankad <sneh.mankad@oss.qualcom=
m.com> wrote:
>
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> Add compatible for the Qualcomm Shikra APCS block.
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5=
ab2cfb2bf879392 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -49,6 +49,7 @@ properties:
>                - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
> +              - qcom,shikra-apss-shared
>                - qcom,sm7150-apss-shared
>                - qcom,sm8150-apss-shared
>            - const: qcom,sdm845-apss-shared
>
> --
> 2.34.1
>
Applied to mailbox/for-next
Thanks
Jassi
