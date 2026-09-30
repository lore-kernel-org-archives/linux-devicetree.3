Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C432B4CA798
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769299; cv=none; b=sBfM2SBfQJ/Isy5lMPvhJoGOmYNx2tPzQTvNe+xLBMcgsEA/TQXrwVf0t/DG5NCYQUHx75ZziFgT9t0Bw6kROoEUktiOdtNKVUw4+BlflSjru+LMTV5M9wBooV1aLSlB9P3rpSmEn22FLO3nLhKSKqEHd7fJ7Uk9pxqZWLSPr3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769299; c=relaxed/simple;
	bh=kq5W5nIu5PLv0CsnhiAfj/Rik2O1CWjzqKYPXqcV1qk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=GDhS1NRHXw/elOdTkmQR97usWs31A9Uzla9juf6wonGbZ4FQKewhqw91LdKSqnfMUmZ72zV6dZQAVQZtvcTWya/d5YoZVifDhLoI3rOv87rgFZ+5KEb/xJhGI8rgs2XPS6CfIwd/K20E92Wde8bdVmck8SEQs5qoYxZmFew2mCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pN29opNM; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pN29opNM"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c570a3030so522318866b.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790769295; x=1791374095; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=pN29opNMxSwQgnLw0POUd1TLywrUAkSo/Cobmj7smnNGNuoxsmw3jqUG5tQNc0Tk43
         oy2wfQAFgdBJmuZrY0HDHK/axqxtmWPeenPBkqt8MmnmPLGE6Ew7VDQxmbXrEIdjTUCK
         jorF0Y7FddHtH+SiVliSDJAKZ4wXT8syDRkHtRkxLjReHu9n78gXgpaKPw5IKmBZ8pZO
         V7jeXGgQZYKjtrJG1L1ZwgindFmwieHe01qFQT8i2LsUTCG+wvk4zogXwjOlEj8Aa4qM
         q+SJFUMYhpQGdCDOQxmRIpWQ1FbMmyQXD1ihw7Hseaq0EIjb+L+VQDcyUcOPD6x+jIre
         4hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769295; x=1791374095;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=Vi6mqESSfJRX0ARielx16bCf2biw0BNfjRYp3hzN7bxkEqS2dQS1fYZKP0hu0ufUOB
         4L8uUBxUGwaAv9yn66HdLPYsJMK0Cis1MwU69dRGjCklZE1UaawuwN/afdEIjTcOH4VS
         4HSkvDlzYm1r1oVGRiY+RvyHV8Rcsg4NUBOFn2epNQUdwg0KIRbO1gLTm99evyo+08Mf
         RV0DGplDdECdBi3ygBJ/sZtZjgJtcJEfeEaC4zSz129doDYl0I3BpsazJHDcpxNsAbw/
         3buZ2RnG5zXZHkmaKRJUdK8AYrr/lgR774sfzS0fUpTIQpntcn1PlprOK9zYFK/zazv/
         otrw==
X-Forwarded-Encrypted: i=1; AKwUvBxIu6FVxIXe7Z36CR/siKDB5crDKLQS7FWS9Qccjt47i7DWNsIcLv2uoB3YN5RBf/KP39Ydo1evcGbq@vger.kernel.org
X-Gm-Message-State: AFq9FYKV4Ay13a4/SyFYvYldTtDBFAimymFRa8ESdcNRLA7Dm3hnqaNJ
	u9PiVlBZaVtrYAdfWoS8EQLZX+2n1LId1Z0bcUMIM6ilgFzaRd+4h4nKbKBilUO1PMk=
X-Gm-Gg: AYBFou1Qj1by8SlNxVGuE/mr2X0kKsMC8zHW+QufFLlTirAIKqm5c4U6zBZ5uHYXbJ/
	kyqYTG9/VIwhp9oNUCTkgtVCBNl0xb3FOcGcCHDMhW0YWs5uk98MHNfn1OhPLqw7+nfIle9vh6c
	idV3c7/3DrG+ImZgavIaAi1+4E5LgA3X548fM/Yce2XJEwWjrcJ4bTIFYaH+T/ycj1JZtmCZRfZ
	tIGzz+7DwyfZvKKrZ/0oOjI2Bo7UqeBPuoyJBApNjujWIqwnUIBzwx4QfqiS4frSIt3iJ6Vq4lf
	F5Jce2fv2Jq0mt4KyvoNfQ2rNEG+wugKd4MuHjWqsTyzQWPshhAMGaMy2yBeB097GgR5iKLmd7D
	MqDYBzD89aysy3mEMho1LdOqwKu7L6RlLHiubvFdY7rlUtcIhT1u0UKLeTZphokKfuAIJIfE23L
	7tOOzoOnagUKz9NMILCrKb/IMQ5v3JxCz2C9btEHWOuRHHAqRK37T0UA9XLPY2r+WtIzH/YFh6G
	SO9wjt1r6xQoXLCsceTHTBbs91jwrd6pCfPQ82oyCa4esA2iSUMEEu6SNh4lnXM
X-Received: by 2002:a17:907:2d8e:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c2e23d94b26mr97396666b.35.1790769294780;
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:2655:b567:7e10:e7eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22e16137sm55259666b.9.2026.09.30.04.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 12:54:53 +0100
Message-Id: <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: "Thomas Turner" <tturner@lineageos.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
In-Reply-To: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>

Hi Tudor,

On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
> Hi, Alexey,
> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
>> protocol provides interface for all client drivers to actually use
>> features exposed by the APM co-processor.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 8a4771899a8e..91c6cee8f483 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -11,6 +11,7 @@
>>   */
>> =20
>>  #include <dt-bindings/clock/exynos850.h>
>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>> =20
>> @@ -170,6 +171,18 @@ timer: timer {
>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>  	};
>> =20
>> +	firmware {
>> +		acpm_ipc: power-management {
>> +			compatible =3D "samsung,exynos850-acpm-ipc";
>> +			mboxes =3D <&ap2apm_mailbox>;
>> +			shmem =3D <&apm_sram>;
>> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>
> Why do you describe these clocks?

>> +			clock-names =3D "cpucl0", "cpucl1";

To link these clocks with ACPM clocks from this list:
(file drivers/clk/samsung/clk-acpm.c)

static const struct acpm_clk_variant exynos850_acpm_clks[] =3D {
	ACPM_CLK("mif"),
	ACPM_CLK("int"),
	ACPM_CLK("cpucl0"),
	ACPM_CLK("cpucl1"),
	ACPM_CLK("g3d"),
	ACPM_CLK("aud"),
	ACPM_CLK("cam"),
	ACPM_CLK("disp"),
	ACPM_CLK("cp"),
};

Eventually to have some sensible/working ->recalc_rate() for ACPM
cpucl{0,1} clocks.

Which is needed, for instance, for cpufreq_dt because it registers with:

static struct cpufreq_driver dt_cpufreq_driver =3D {
        .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
                 CPUFREQ_IS_COOLING_DEV,

Don't know if it answers the question (if I understood it correctly)?

Best regards,
Alexey
