Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446B48CD40
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781654; cv=pass; b=LqXLuABefjDFTfPtjOHfzRckTNbOnGN4vfwwpLu/L+8QnDiltDCXDGRXmcV/rFS5EKF5xdQ5i2B/OcyoOTLV/7ooEfVs4/f1INGe9OpWbLOe227igfAO7MCBdkD8XXvA1CJPkHrRz3sYXlHK2xU7jb5AvuARGcIphLS3ammwU/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781654; c=relaxed/simple;
	bh=Wer6SSG/uDE6Ee8Fljcjhj1Fc9lWtsOpuA414gbFytM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5y870W2MVvAqkt+yoEc6GxqT5qebOF5rPMOHTjTEwJmf7DbBbH2Z9j3DLUMsWh9mCvmJZXuNgBf8ewF5ZS67C09nkvDTjs4KevPztgsLOWZGwii1Z/3d9rhyVjVnDzfMPD4EzEabltjIdxkXEoAZaEQEQWcGgRGvhE8yUCpSnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVh+6URp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMEAMZuI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVh+6URp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMEAMZuI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amxkl810029
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 11:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=; b=KVh+6URpAkw9KsmP
	irbg8XvFBh9A6eBx989QXAL13WlV1Jrh0mmYPZdj5c01TfzI5xEL674WJwhfe/jb
	OUAF1Vr19KYwnmcSyjRMXKsxQSN8Eki9ZmSKwly25d8wWP0yCrnERjKfhU+9MroU
	prIf7hQRZvLYIqHCoodMOd3xbVg3LhDZ7fdV3HctW0nwhRcCI28jcWO10KUi7QDo
	zwJEogawHXaLyFiJgy+m3QvGGkIIyLD96we8/PazWpLwlWmaAo7pC0I++u9MsEmW
	CT/UDrMsb34cZOdGk0moA5xFjihWv1A2af3GDOcLHXLBRxtFA09DbYaL3fVux8C6
	i03mMg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua97u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:47:31 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66faff68c0bso4880133d50.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781651; cv=none;
        d=google.com; s=arc-20260327;
        b=S/N472ncKl2E9ffQ9XPkDJvEgkLiOs9CF7P/zcmDchipOCOthcKwK+ekFRLhB2lakr
         O928o0CusKNeBG8pEhBQe5RiXXxabzGvFCutSPhDXlswdFy23nEPkHbOFRyAteDv+5Ua
         WTMXPIECPF2xly4VdGbbvwfQf7TUxGydttEIA8BQHgFi1yBJMKC9pw0DPZqjC7remohu
         VUFVbP+pn9fzxnDtJGiIlmL60nCKwP3vMTdyqOb1AOe0b4XkTbps194EuMm+weFzisba
         jF/9tDaEAHGfOgUS6WVQzXaS5/xmf6B0LxGhTKSDFjbzkqPijz01c//9zZozt2nxK4GS
         H9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        fh=Ez+lJofDRW0Qkf8YWyuvMZk7rJNMg5zPxW8uYF7C6l4=;
        b=TV0+Pe6vCNiBWgViyc25vJ2CDK0oOyzoIbPWkPeU+KyQjNoBQjoqfjoccMFmoidD9X
         /Gs3hUBfMsxvZU3uI8Rjkm54ZQg3NWtBXKP/ueJo+X3hcIBDZiz8Fyqt7vMrj+NnmHWe
         YuKsNV9IBWwg5O8R0qcS9B5fnK9HcBXU4uI7pjxBoVrZapkxPbi9JGBlmE9b7aA+Uloq
         15Tdh+r2z/OrkAM86prOdeJPBpCfjVIe2St78EIczsTgMjPI55717xY6jUeVxkXV5kQ8
         ZAJSCVGWU2a7VQY8Y0vlOrov2aGa3Mht8XrMzOBkDqUlijULNoFx4qXTq3cM7R72RUL8
         3Fjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781651; x=1789386451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=TMEAMZuIT+LoJN2NefwoKobwwgz8IHx3Pz9ypLAlt+KzOSO+WWA5SKIbwPGvQFaIiz
         EuV5z6NhFwed8jM4Fo0DazGqrALOTk8XTL79OveVX3CZxDvBhJO/RaEvgc0kUSxhe5Rn
         ZseR4Rt/50I++/hiVAuv4sY5agcEjGx9GV4UGkasgt3b8gm4IV+jjqeSsorzO1Mv69fG
         Dyk26GmTx3IWJ0qB5OvlsgqF6uqrv0x/D3EqdeAEQblrTqwlELVOdhexUWwDjzE6FC/m
         sEuKq2ObZAYVOusjDTp34dhKn8pzx2gRyWeM1e2bHxKpmv5HmUS1+xiDB9FTRL1Iy5Mn
         qEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781651; x=1789386451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyr2Dn/TQ2r0AHguZSfEcPQuWVOImDyOiCZxPv9gNbc=;
        b=fYGAz7bvMnzS0da+ar5jpl0aBvF9e7bAV+a1aemf7vE6GY7mgQHRfSoVIMv3XXV451
         NL3uaxqQTNULJam+VxzTMd68UnkCQvIg2vdZ4Y23dt90xYToiyJdeKhr75L6N9Drm1wD
         5oz6b30Vyysz8jnUeSz2IFeZRvRolGyJBTwixkCwGYlECB3eHMfLoI+mA2/2RfJwF3mK
         WSipaKyiQau8FqCMCpnhkCWi/t4sv//vPafF4DZkj+eC+qRRJIXf+34XVyCMdQip6HJp
         QLt92wgAUx33KCSqWyVGQ07ZDjY5jGWQdauhrut5ByKYlkN4XDdAnUMo5HIe8/6JKNwj
         XPtA==
X-Forwarded-Encrypted: i=1; AKwUvBwWnQvmChQoUnAcHdJI0XWE3RPiClVf5Jb8z6wvykU/TiqG/J8PZSDip1elHzk5YVXfU+VIYG7wz7xk@vger.kernel.org
X-Gm-Message-State: AFuF++k+Z68J8qhspHoM6ccOR8Y6fDuOiY97m7R7Zc1X0jrYWvZ0s8sK
	MSa4KgIGgX+RzEIV9zINS3VCh5HmLrQA2qUOWvsUBf/zswYvpRS2paDpXAJeaiSWUGLSwuU0hfD
	NOd5BQSS0j1h4wupJV8smckfQZIyJ6cfTWgnKSOE0Rw8gfnQw/qNxDp1kevBJLEx8KeTVJaab1k
	TOjepBl3YKaMyCW5jW3+wI9f+TH3/Wr4nmDm3Hb+A=
X-Gm-Gg: AYBFou0lQWogz6NfviEh553/n94HIaH2AGlmAh8yd5DKARm2D6y91wxf8WxiQ6Ak9TJ
	6m67hvyj8mMSPqjG0z5lIHryf+VP+zgfCAuxqqji7zJmSMAE9qufcbfWxe4lv3D68a2YCKfhhHd
	n2pp7eSXmag5BBklOaiE41YI8tQJDJFEO8kNZeSp9hgwtJo5K1QprQIy5slQ==
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id 956f58d0204a3-66fb5abc685mr5954567d50.35.1788781650718;
        Mon, 07 Sep 2026 04:47:30 -0700 (PDT)
X-Received: by 2002:a05:690e:b8d:b0:66d:2276:bea with SMTP id
 956f58d0204a3-66fb5abc685mr5954550d50.35.1788781650223; Mon, 07 Sep 2026
 04:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll> <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
In-Reply-To: <58e186c1-d199-40ec-a165-2d3e4f36c623@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:17:19 +0530
X-Gm-Features: AcwNN1XXb0eVO7BU5GwO2TvIzIj99UoYsYsbFLmLlnq_kiZvskMwYXQlzc44yys
Message-ID: <CAC-tS8ANBcNatz4LO781zT_4XKwE7TkHrDaQ4N8JFr5x_vFvFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZgDS81Uj4Jv65QE3i_kLvysT27iK-U2O
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ea453 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jnI5DnPC5xRnza1bqQQA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: ZgDS81Uj4Jv65QE3i_kLvysT27iK-U2O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX/Dvo4tiY93wt
 wJdY0qa6kTH+Tlw1icAMViz6tTNKwy4txd7HjnudqbNjRIYMK7xkrrIgqRqfnf7q2CO9Fp1SyY5
 tABHuTPPSgjo7WGtp8ZeyHml0ud1STY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX9CfNGfJzSADN
 fCUE1aWoP2GQF8eJQLE653ZlrwzptSAG4qqdh8Lm8CWTsJ8SpuFrxJCMyVdLqB+bk5mtjx/XVJA
 JeTxtltc4jtveinGyAs3FaVauKTqAEYzKzHSzdTKuggOvN5OVVJTms6IM9FlEubWa+a2fyauOyk
 ksJ5S4kT10SRPIBCN7rjoxo6wjUh2VTrTodSREC3xAM5CuFjGnpZhIAW56YDMjhRzXVjYwdrx1I
 336Mrfd74DN2bZ/UUGhdOLgmbo8kGrgj5ZLmgzq2eirxjDV7ejMmnaICCbhzLVyA+DydE9OrG47
 QXBPdHYSH54vqnTAy1piF90jSJJ5bktRPDC6pSZ/a6gPZ/uHAWyTZiOuVpZRQi4TSODkXHdyI4R
 gf8SxieUtzRzUGZh5vtyqTnPck/8dlan23xB2ZjSmncDinKAbn3PW13uh46LYwZzbD0zU7Ezjim
 WldPDDaD6dYFPteXMeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070130

On Mon, Sep 7, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/09/2026 10:30, Krzysztof Kozlowski wrote:
> > On Thu, Sep 03, 2026 at 12:58:52PM +0530, Harendra Gautam wrote:
> >>
> >> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU=
 DAI
> >
> > Why do your commits have leading blank line? I mean, really, how is it
> > possible to create such commit?
> >
> > Additionally, way you send your work is making this unnecessarily
> > difficult for us. Look, does this work?
> >
> >       b4 diff '20260903072902.3870009-2-harendra.gautam@oss.qualcomm.co=
m'
> >
> > ? No, it does not:
> >
>
> And now I checked... and you did not even use b4 to send v3 and v4. I
> mean, really... why? All internal guides, all external presentations
> EVERYWHERE we say this is expected and even almost a must for bigger work=
.
Apologies for that. This is my first upstream series and I was not
aware of the b4 send requirement at the time. v3 and v4 were sent via
git send-email. v5 will be sent via b4 send.
-Harendra
>
> Best regards,
> Krzysztof
