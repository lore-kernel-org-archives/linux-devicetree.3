Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F93CBE84;
	Fri, 17 Apr 2026 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776447436; cv=none; b=ZxVV7MkI8pOc9jecxMyxx9NndJ2JrN00GJ0RCHbktT2Qn/XjYpNNjkU6PMezzdYtSFJIltOSU5E4QcHUVBtY2XqurPlaniUrD+Jkkt3LvUg27MuB9fgXhJ419ljQksWDBr2dpTgJqulDJ0J4as9sKJoop/Y5+QIhX0W/LFwhn+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776447436; c=relaxed/simple;
	bh=9y2QoASOM9MMPxSjvfl9bNKdmJzTA6igGOh2sTX6NEw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PcMfhjfiUxExbT+Sj3iCo76WIpD3mkSZl8CBoU7/7UJFU1m0sRt91cA+O3XcuPXwPibcM85/K7n/uv59RaEZA9iEVM5mK2cHFkh+XPIguMMYKCHv28Nbo9aEOBv4mY9PQO4eOn0TJeunb+/fRpawfBKGqy/IkIGFph7qrPmi2hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TCngvn0r; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MThAJ7xq; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TCngvn0r";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MThAJ7xq"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1776447418; bh=cJOk6Uml2mDgL8kT/Yc6gWE
	N0L7skJvSV1FUwIekVFM=; b=TCngvn0rTMLzU9ofdX2IsclY4ujWRr88P2r+Z7PpsxJhyBxhck
	IyzMZcqa4MG1ZyUX9N/nlqVo+RHvM3Y6Fox0jz+62dz1S9NFrws1u/ZXMq2Xd92iniZP6Dntkr2
	8cGoKRjjBDPT7zu7We/qadbxuQEfyqKamisQW8igfZtMBBtz7omE8dHCZzWBP/gGP1jC+bUHDz8
	1CXQ0QS64mIeF6U4WMqw3zuluSNXkrd8+g5B47v6afPHAgCOHAiJzu3gekkLBmKe2RD6kxxeV2L
	vMS6RHzF/C3J98/DqrWFV0GslTkMj2hFwpqrTKVnIXIxCTqxfkKLRt5o6mnqLqnLj8g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1776447418; bh=cJOk6Uml2mDgL8kT/Yc6gWE
	N0L7skJvSV1FUwIekVFM=; b=MThAJ7xq6zsVFozYlsPDIjIhKBJAPTqZvAAjCUHQiwHceEen7u
	JUCIP9Dy1HnqdSJrEGSO1vqhcbq+MtKdV1Cw==;
Date: Fri, 17 Apr 2026 20:36:54 +0300
From: Nickolay Goppen <setotau@mainlining.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/4=5D_arm64=3A_dts=3A_qcom=3A_sdm?=
 =?US-ASCII?Q?630=3A_describe_adsp=5Fmem_region_properly?=
User-Agent: Thunderbird for Android
In-Reply-To: <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org> <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org> <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com> <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
Message-ID: <760729E8-7CD2-45DE-B3FB-7A28611E5EF6@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

I'm assigning this region in the fourth patch

17 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2026=E2=80=AF=D0=B3=2E 18:15:45 GM=
T+03:00, Ekansh Gupta <ekansh=2Egupta@oss=2Equalcomm=2Ecom> wrote:
>On 15-04-2026 15:22, Konrad Dybcio wrote:
>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared and reusable so
>>> describe it that way=2E
>>>
>>> [1]: https://github=2Ecom/xiaomi-sdm660/android_kernel_xiaomi_sdm660/b=
lob/11-EAS/arch/arm/boot/dts/qcom/sdm660=2Edtsi#L448
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining=2Eorg>
>>> ---
>>=20
>> +Ekansh some insight, please?
>>=20
>> We're giving away that memory via qcom_scm_assign_mem() anyway
>> and I would assume that making it not-"no-map" could introduce issues
>> when the OS tries to access that region
>>=20
>With the current version and the upcoming planned enhancements, I don't
>see any major benefits of making this as not-"no-map"=2E
>
>With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
>entire memory-region to lpass VMIDs=2E and un-assign it only during
>fastrpc_rpmsg_remove()=2E There have been implementation in downstream
>where this memory is dumped in case of SSR or audio PDR using minidump,
>so marking it `reusable` might make sense there, but that dump logic is
>not added upstream=2E
>
>Upon checking the DT, I see a bigger problem here, this memory-region
>looks to me unused, it's not added under fastrpc adsp node(ref=2E [2])=2E
>Please correct me if I am wrong about this point=2E
>
>[1]
>https://lore=2Ekernel=2Eorg/all/20260409062617=2E1182-1-jianping=2Eli@oss=
=2Equalcomm=2Ecom/
>[2]
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/next/linux-next=2Egit=
/tree/arch/arm64/boot/dts/qcom/lemans=2Edtsi#n7500
>
>//Ekansh
>> Konrad
>>=20
>>=20
>>>  arch/arm64/boot/dts/qcom/sdm630=2Edtsi | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630=2Edtsi b/arch/arm64/boot/=
dts/qcom/sdm630=2Edtsi
>>> index 4b47efdb57b2=2E=2E13094b5e9339 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630=2Edtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630=2Edtsi
>>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>>  		};
>>> =20
>>>  		adsp_mem: adsp-region@f6000000 {
>>> +			compatible =3D "shared-dma-pool";
>>>  			reg =3D <0x0 0xf6000000 0x0 0x800000>;
>>> -			no-map;
>>> +			reusable;
>>>  		};
>>> =20
>>>  		qseecom_mem: qseecom-region@f6800000 {
>>>

Best regards
Nickolay
