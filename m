Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793867907;
	b=Y/YswzGw9oqDku0zsWFRP4q2KrrrOz1XUW94UYcmfCMTdpG0FGjmDEbKY/qxk05KjL5a
	 /bBCQfgqJuMYQGkLfL26iVcFD/XytU5tXzPDgyXsOx1ZfhtIZPDZLsUaLXFNy1eHzmLbj
	 3uwA7LqBRTrh03E20BKwZ5aGq+iIyqrKg6adK3yD4xVcyqIJ54hpbS3v1HvbwFzIGBDtT
	 uhBOZKsiQboWFRXLvbz/8DZjqtTn7xJoinhSbbYLkaHFpLqjYdnqvtZ+rZtfuu4zrdbRz
	 rJBU6Dnl77KV+hGFnjvpTHFkIFH/S016CnDgSKYD5yxHewNEpeS+4v8OxcbybmcmwaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
	b=cxDGvzK10fJX3gWGsEV988627hpacAV7HXlhoY+8tlrb8mRKGDRYRRJGNXj9fd4g5rEB
	 96plb7Jf0OSqlg543nj/i/iNCjpIonlaksSIqhlM6WG5IUOR22gqVfFKiuc2ZF+jBFHFC
	 j1wHauYmTIAWpOm8CtahwGbj83JgehhnN0ISag3/cduihT7DlRl2WbAE+VbpRUyiDOARQ
	 XpA7o/10sr8judZeKMc+Cx1xpe2pqbgeDY+R56bKN5zl2c6FpdXnMmb4vGmziE26R9uLb
	 tna8Sr0TtfP6lozHEZFhKcxQ9JKJcf5ui+RCMXg0dj9bGH66cCenxQrurbPpK52DkaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MT0bcWVw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X357HX1X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ABA606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72ABA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MT0bcWVw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X357HX1X
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U8Kv4169642
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=; b=MT0bcWVwxNd47Za4
	3xN7qRK5eT9NaFg7k1a12Nomu/0HGiWDMCDUHklSBvxgkbG0ir5ud3AQCoBkDxRq
	sJFLePHQ2zy0cHlxOUpYvglzSrCLb0Ax/wxBEPrXVJMVUolOH68ZR80HrE9rCm5T
	5ICHFA87XvLFtIN5A58VhPrP0KQcSu5itmXDgpaZfMpBSispwxEegH5HzQDs8aL+
	9uXDvfUbU+8/NbU2eg/QkdA7CluMhzKsOSikqHGhVGIEGVoRiV55orVHYYUJHSwE
	YH60u4G1SNh9tYm/p6VncNZwDdig5JFLidOhaXyfEVPmH/wGqQiKaHYZ4Ye0dqAp
	5arn6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8hjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:38:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f62934ef6so392954885a.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793867905; cv=none;
        d=google.com; s=arc-20260327;
        b=kdXtnww0an2s/RkL+jcSfBGQhfZWcsLr2qtBDuInh8w0KVCsiy3TVvGsv5qPTab8lq
         olK8XtH2DB4XyONptsxY47dUzmMLG6LSPn12bEOdgNjHJgPS9bcFFefhNTP0UO0YZDE5
         it/Cfue6jfr0ctnxv9ri6GnD7pUmzXYTjA81jXeoGxI+DTjkFTB0oFb2Rz3o7PVUVBLh
         yu5OCAD+v/vcdP/UA8VlG9CwT7xCQ/qZ6blWT2Y0GvWjOdRvuNRjNOgf+jpgGHj2FObu
         EDJkxqTHQ7ZYY5Rt18CXlNtFooKxw5vJbodq8/cJBZ6eommOHK/hvTHrISS4EJ6ysASC
         bsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
        fh=lN1mX2EWugvmdNa/jKiT++6K2FM9wU8DI0W52Dbztyo=;
        b=gbwjBYFw11mHiRIw1h2fFCn81habB1M+VO0uR89PFVrH99SYaa6r2N+hHBvpAW7lG2
         L9QjJSTDgMEFep+7/jNEofCK7NHluK7ZbAJReB4cJhV/GWOmdl4auFAymH0p6ea6Ruhp
         E0BNO/4o9DjPR0h0DefuLNJbCkujfmISL5VAlFzQnc6rBGSobsdl+wubXIPvSLHFFHxf
         TVAr3GPsjwA8fUsInHzM7t1xI1RCjgoE81hqORTHmGMYTmd0W05mOR3VDzq0hG/b6Gw8
         INLV++hYWVTQN7XIh5DsmFszgYM7rXc7cqKKxmQQ1jW6OboHUz6Sl56qw/qhF94NfVgm
         p0vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867905; x=1794472705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
        b=X357HX1XHUwfteEiipVxkeCq+bo5DSazbP1/tjAoXnJQIZAFLBEesajG7QSAAWrr7U
         bQ5fdAh99rZYeefP5O5ZUA5ujsuoKQ/3sR9FN8laq5YhKzQWYUHfbMweiv2ouXQ8flaR
         1e6DICt606KachgP0h2ToXR0MDFVc7+8RozDFKtIZq9XGYg2pUJisgqPMftjx2UGuU2w
         Yy3bu4BAzBLKFORs0ckx4m40ccwu3tn2VKVabyqLdWUD3R+Hyb0JZjEW/s0XfTpdmHkL
         4CZqGD96qW3nLzusqZJg4mOQSuVDOpB3zDUf0xu8HGep3TVxJCft3409hJ6Wa+PeL0xr
         wYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867905; x=1794472705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
        b=ewvKAOHMGQ0Jmv6kRwZVRzeu2UPoGw6gmRWNhxPdJRf5q3hTZCAhrT4xHu77YjtVn7
         VtI/DCpnlO61RAt4ivU1c/oy8IkRVGzWlEietEk/J8zF85fVuel2lzW7wn0m8AZvIqaD
         6paXKrdZyJL6WLZNxnDgXgX22bq7LTDeZAkQKu3U/BbeXZM1pZDtw0ISrQhd1IrqBrpO
         ddKjYmWUp3M+X774EwzsQqC1RY0at7uxy7VBjOl9prN7UpyWYR8tveWeBF8sUZMjlIkk
         1VGr/fUsAhL/cT7i6YgmX/5km2nyKce1um8zgyl/vN2FAj4TyxLF4dA+STh+0e8STB6b
         JBBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+tnwQ0merDdHq2GZFLCjIGCXRD3/qQo0n3SF0x70ZWwtcGuTf3RuONmseMgaDwHDVCFt6xqFBb2RW@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ih7Q8ViOPa+FohGx9f1A2J1m2CaQwxrRsQMSyElGz3YtPDxTF
	RjG1QaQNTETFKv8NEQpCT9ZFpJmXUJT5u49nti6aXALzbH0qnjsaEefC3jNeNd3FyjT2c5ATJ8q
	+JxJbNhLUGmbouVn9rL8BPs5+2+BgnHHF2vumSQywM0gRVac78ZawwRl4tShl1YjmcxuuzVXsBO
	YIszSttuhSBanuTwtWSvvL6ZS/osRAkHpWf8o2xx0=
X-Gm-Gg: AYBFou19U6//fleyCaT+49DOXOs0XUZCNIssQtcf0LSn7O+xijn2FWP0MjQOAgXA0Mp
	14JOawpBJnlAZWKExWygZBFlOzxVjY4TvS87H9vhFuXf47jdHrCJKNMRV28rpDggGow48ZOXb5m
	cAq6T95f5ggZfd1WJeLdEr0wgik+yDwnDAbjnVWFhI52ur+/BX2pILjyfDuxlKpzsdmyB0oXixI
	qXNc3piRrob/XvqPDS5vvJ9u0Rw2pjS1y586f8v+2vyeMHMIU1MoKnaXuZeGO6Nal3J1f0COPO3
	eHsA0thByD0toGTAgRRExT28A1da
X-Received: by 2002:a05:620a:444f:b0:93e:6620:bde7 with SMTP id af79cd13be357-94421712a51mr3342705985a.20.1793867904598;
        Thu, 05 Nov 2026 00:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:444f:b0:93e:6620:bde7 with SMTP id
 af79cd13be357-94421712a51mr3342703485a.20.1793867904183; Thu, 05 Nov 2026
 00:38:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104230529.3040285-1-vz@kernel.org> <20261104230529.3040285-2-vz@kernel.org>
In-Reply-To: <20261104230529.3040285-2-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:38:12 +0100
X-Gm-Features: AclHuK_XOYAY9o7oM-e2793fJtzmXvNCrEJQLGGzCvifJ5wF3W3-wOy2cPxKVws
Message-ID: <CAFEp6-2sv6AJhWqABPzQQcfv84j3VrR6+_=wBst9L5GdNZgQcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document SM8350 compatible
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec4081 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-vm_nUme4f6pGPv4iSwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Msar0__JT7kUhz-SzbwUHZeispo30QDL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX7cAdbyCxP344
 4S+/z+uLt4KQsCVWRrHE4RpHbzV1N+XGtlGx9HoVhmrwAxGcLzKIW/VLv0rFM9gsiMCTwwWhRAD
 7o/gfuFTTM3JuDuIvVpwz3B/Ri7yscc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfXy5S+V3LO4BoG
 82yqu6m898n+2+35spwxosExbqOKtfF3q12ibIMX1VBsT4AC7cPokTkMazWMLCyNtowwEhZOyrj
 2Mr1X9gYD/BLvWByQyQ9UbJ9UgfBDKNaQAhoEn0KJ2rIyGVKKAMHFHaJiMTu2S0VDisklAiHoUe
 eA9stSEY7pxtfHXkk52OJ0jYmb+vJ9NQovb8dRTzRBXcEKXv5NwiUxYTJDlpIy8mgJV3niIW5mn
 LbfOYB9aJq0DO0BN0nA3xHF4YCD1msaWKdxV3MOSwJeCOWdPWPkwmMN4xqhqrbGUb8mkqp8G0tV
 DUOdiOOgRNzUaxHN/nP/ISJAO3eOu8oJRFiHqLAH+TyU+VpDD0dfjx8W0CJ8JHS1f+gEc9NETlM
 HZh1vA0TGwXLgBfgD30TsTqomtzcvSXqKtcfnHUbNgXG91CHwyBREmcWZnmhmPlcqzxo9H60OCS
 uX0goRJWcqjsBQ6zmjg==
X-Proofpoint-ORIG-GUID: Msar0__JT7kUhz-SzbwUHZeispo30QDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050034

On Thu, Nov 5, 2026 at 12:05=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.org> =
wrote:
>
> Add Qualcomm SM8350 SoC compatible to the CCI device tree bindings,
> SM8350 CCI is compatible with CCI v2 found on MSM8996.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..63083e0bdd9c 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -40,6 +40,7 @@ properties:
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> +              - qcom,sm8350-cci
>                - qcom,sm8450-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
> @@ -219,6 +220,7 @@ allOf:
>              enum:
>                - qcom,sc7280-cci
>                - qcom,sm8250-cci
> +              - qcom,sm8350-cci
>                - qcom,sm8450-cci
>      then:
>        properties:
> --
> 2.51.0
>
