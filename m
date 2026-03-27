Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24A237E31D
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646813; cv=pass; b=Aq9bXTImB0KwRJZV/jnntdtfU3OHVyz+mgDntzJsaleb9mqqBNYEKQIIKdma2MpPUes00PjwzSPsd+hdowT5F1aQbyE9qHlrntu+SoTriLKqcxyt9dxuDxxDQgBvSgP6x+J4oBrcnQnXiKGU8izbjTszhGTLBF95HPYnT7Ecxow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646813; c=relaxed/simple;
	bh=kXXw2EpTzw73Xh0bFqRGE1umhRlJsmgldTwk5XXarrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHBul6iEY1aDe1lui6yZs4sQQSgWraD0a7OSQAbrBniDbyoCugyEHU11Yx9OU+j8md7bzA2wUY5XRXULG8hQgDdkHnFbwRPXkmPLBiPvwiNOK20zac2M8XrrUV7y7nIiV+cXwi6RwLPA/EbWlFiFeEk05okOoka1Giue2mkF2CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WO5bVE/H; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WO5bVE/H"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38c51c8e055so21983231fa.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774646809; cv=none;
        d=google.com; s=arc-20240605;
        b=Tv7tC2cQ9um35TfAO1tiA0BNI0u7H4mE5S4CwN9rOviGTWTs7At02yywUNTYUYtdeX
         +XB9neCQFjdgo2bJ1ZrXUlLBVXQuyeHOG2nJZnTutlGyoIN4ITdCFiwaH3P7pcuOSKkV
         5uz63Il7g7q+bnchpopgiajksIGY1dflVoKfXUxrBPUVnEZeuwRX+KonLbcHnC/NqT/+
         4rUNQqXLeDFzYubN6IWpPzXk4suCjz8rcFr3469ZvAXmvTsFEoS9AiyP9M7hcfhHHSwr
         +XVSEWQzoLvtDCQ3cD9t4X+Iz+uBEkf+lWk9XYgVBsixIeLml+OU4guPi9kE+hR2n6w9
         gOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzIbpxkj1XRC8SKR4D65gdSBDHJHQeOvaHBqMRkagdc=;
        fh=Kj9Xs1tttB/nW+LhzDIBm1rUjA58iEEz5SAyLMDuXDo=;
        b=TCoMbX3z0nhlMSYxx2MCfpEf6Y7fpBfh3nwM2TotgR7Sjsr5Z/1asY3x+QcldyEAVd
         E8VgaCJRVWrOKmVUf2SUeBrg9uLW+43jAGYYg4nFc/kT1W5sRlJg7BkTUJMHkVyFssq/
         ItQyaSJkbKWP2QWbOUg3d6huDyZYjIO2hcbeuuTW97JVIfn4aY9UmiNXwxeynztH1Qrx
         53i12ugSrGM5AoXHLUByUoZ5GMwCyPB+K/qGyM4bvvt0UCPaIIMPOZgnOqT5QkOcVTjj
         mr1BqEF12AlGuVD9tRIxwG06R2ImVbZ0rAnMUdpv6lJe+gmENoc+4daWb0l4euWufqOa
         6UKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774646809; x=1775251609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzIbpxkj1XRC8SKR4D65gdSBDHJHQeOvaHBqMRkagdc=;
        b=WO5bVE/HvGKWnMlPDlbPx6A2wt3iAJnVAAZnAhJ+tzSbuejVf9OoWvnvm6oiMx2v5B
         FAQzL9sxx72V2C4+Tg9iMjB9MS3siEjpGIRunZK0CUvnc088Jdh9pIhK0IZVkzXdV1ha
         Yzp0SUj+irebdGAgJPWfpINGPaYE4XTL5vDUw5tVH9pLFY350cuz+6D1SATwKH7Vjp8z
         N1sl7wPD3NMtUuoQ6rlJ/GrDD9uhNVXacHVB8TbsrsEvNfvQAW3nsdXTE7IzEK8/Ztbf
         /DL6UvfB6LOuE9OAdvsPwNuj/BVuLUl8PKCrzfklOQk8EQEZIA0ZWPlxnh3WknjPhBHn
         +tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774646809; x=1775251609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yzIbpxkj1XRC8SKR4D65gdSBDHJHQeOvaHBqMRkagdc=;
        b=AxxQo31EBxUuNMj1ZJ5R65Ux7O/megzq5SH4MSItTBBDRQs6t69tG1ypkcfe8VKRFL
         wxoRHRuNF5Vr8oPTPy2PGl5uJuYDIQZIOLYvgxKsNtub3DDgowJMoRXfeIz0O5WnH1mN
         egp5TVYIVWNhM0Whutj/ECUlx0GtizJ5DNnajF2fiCKGFvAk6/jKSh0XVhSrYJ2sJ18P
         6L1cCsqvOj6mBs8KpO21/azBZdvu0ePFXA0Zx3TeZLkHtDBs0fLN1ys70a/6tmmllGqG
         +549+QTb2xnR9hjfb/Ch/YEiiQzngattCn7f3GdBakBwmCFOtSlJCFiu58gSYZEjve8H
         blmw==
X-Forwarded-Encrypted: i=1; AJvYcCXkr3/UzUPAWCp1+pANj8i6bXckpACw4n+hA67qDvBCUS39u29PJBDXU2Cbkls4OCX0PGM3ZMLr1Ewu@vger.kernel.org
X-Gm-Message-State: AOJu0YwUA97NKV1hnHefWxDpo8St9+bQjV9xU+SScAWFz2d/s7cq5ulw
	EFx6MmwjVuFIuyherIXa35t0k69NMqR1eNJrelOh4irBuqZgVaCaFEUDApABW2Xm14c66rNwgmr
	Dnz4qoY2Y32NGOwGGgRvY5HWx612uZA4=
X-Gm-Gg: ATEYQzw0rqk3UisOXtqdt1SQpfcj46LVI57kadR1jzdBfqwaC4SKY1rXIOUaUPLKw6/
	H2AvnJBSoSm6riLLg8gCgtUKiawDo2mSu2P+VGa2P6Qe8bfoq0IuepH4huptfduMPSvfQt0ITwj
	1o0dIG68JGmtZOtnP/WfS2e00lG37EhoGHE+CqZQ3nK1nIiz8qK0iRceiyZuhCX9X0uazgFPqJy
	JqzTuityqeESw+53vwPAB5qpR6aEXSMj5yahRqay7Uoy2EEqN1HmRkeX25iq1z96a858qjmPEjd
	S2eu5Gp/dYBx23pbz4HU/gyrPU5C/HHpZWMgi5IOT1SEFBrvux4Hm7j4jAMkBar3yRuP
X-Received: by 2002:a05:651c:ba6:b0:383:7f85:8eef with SMTP id
 38308e7fff4ca-38c74005967mr11179111fa.29.1774646808772; Fri, 27 Mar 2026
 14:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com> <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
In-Reply-To: <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 27 Mar 2026 16:26:37 -0500
X-Gm-Features: AQROBzBJNtVhSmKRxa18c4GOnuqAv6f3gI8w-11C_oCyNdWuKoTbBzj5UeSOe4I
Message-ID: <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 7:36=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This contains everything common between the AYN QCS8550 devices. It wil=
l
> > be included by device specific dts'.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +     sound {
> > +             compatible =3D "qcom,sm8550-sndcard", "qcom,sm8450-sndcar=
d";
> > +             pinctrl-0 =3D <&lpi_i2s3_active>;
> > +             pinctrl-names =3D "default";
> > +
> > +             model =3D "AYN-Odin2";
>
> Is this enough of a distinction? Do you need to make any changes to the
> one with a HDMI bridge to get HDMI audio?

After this quesstion, I tried to verify hdmi and am unable to even get
the connector to come up. The lt8912b driver complains that the
connector doesn't support edid read. Which per the current connector
node is correct, none of the devices list a ddc node. I am trying to
investigate this further, but vendor source release unfortunately
appears to be missing pieces related to this. And no other current
qcom device uses this bridge to take a guess at which controller the
ddc is on.

On a related note, I'm not sure hdmi is covered in the audio topology.
What I'm using is here [0]. This is in a fork of the topology repo
with aosp build rules added. Speakers work, headphones out and in
work. DP works only with the pending q6dsp fixups series, which I
should probably narrow down and ask for a 6.18 backport for. The ucm
config [1] I'm basing tests on doesn't handle the built-in mic and I
haven't been able to figure that out yet, so that's also unknown.

Aaron

[0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/=
blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
[1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e=
8d9e08a024cc84c8055bb7eb9
