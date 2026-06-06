Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB1395AF8
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750647; cv=pass; b=Q/4765ztN5ykyQiaW/TWkAonG86MOj32Y/nzv38Df9/NP4HNs2YD8MiCJK82yh5igKDqyW1xVIzVre0i3g7G7vKuf/UpuGbTxCIda7x5NVGLptbOHTbkNStyYhmMYyYm0oHr69aRb1ioXoLXv/rTudfXlwhgERDAk/ExFlXWLJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750647; c=relaxed/simple;
	bh=N2ev8NttSPp3sm8JN17mx+8UplfZQ9K6+B3+i211/Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5p9XyqhpATnwbeH6Zc0Etv2AeFU2eLqu3lOOdl2USDhz2Ouqv5RtkdlcaSzRfFqSkGbfN1jw9BmGdDuaKge51y83pdILrS7AxKhukbhFxNv6uxZyZwAm3saeMDaevUwBHNuZomShqUTyU3+5fXK9pnl2BqwZNQfTV3DNh//gmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Snec7G3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTFw6F8C; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Snec7G3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTFw6F8C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGusT1311243
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=; b=Snec7G3w/7iD/SSO
	GVTQvnZ2gjF2VwjWoNnYCmMa/hIIGIxBdya0Y4Xk/FRjHec47aDV7VlDpQTnfgJJ
	1yUJvXglwD4+J15UtrB6o6332VomC5gGsNjr3nFKHK8SN11dR9RpuIaGHXgRheIS
	S2gBSDtR3tPa9B76L80rmcc0dAZFd2mTLqsaLCEUM6CDQfG8Vbags2571yJD35pE
	Jke0AgNfr2vTcwCI1fJXus8nC357e9VIKeeU3l+Q5x6MDJ07prQ6w8ntljC3QUnX
	ro4gWiBST1vXaEXfLtaYUvh/odlLt6q6Z8AOG1VugemDGV9zk8gwAMHvRPZl6wc1
	1JX8jA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w186y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:57:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157929bf8fso152233985a.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780750644; cv=none;
        d=google.com; s=arc-20240605;
        b=gpm2Ip3zh7zsDeA4+83XzSds/QDeNYmidc067IhnMmZ/M5t6s4iLfdrUN8LXR7nhlg
         6pAnp/B9/MGgOIm1U3KIQ42ufOUUj/0oLNoGPhCFyzwXV0CXMjDmg4OWfHT7g3bx2BQ4
         qdioWuCsVmcaM8KiiP3lVCGridfZ1wwHbI1N1a48geaKTj1xwFCQlpzTGD4k5SJmiUA3
         ddEqhBKAd44O7ztIWVR9RwXK7K5FNtK/RrQTz0enIDo4NGl+Tbc3Qpe5zi0Vv/PC8Jen
         jDHPfSfHmfmJGqbJAkeeVWvsFcrKEbOp+TB8UrlxaHxGB+3PpMv0a7guO403m55KNuqG
         Tkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=;
        fh=rtSWyYANL/XCF9D8nzEUFoxEwXcg+m0rjCjya/ACRLc=;
        b=SPkl0pynwxKcfUIz1hswwxfU7ZlyFVqIM3KUiAgMpcMZd48nDvAYNQ3FhUxQfQdfW5
         WU8Lpx862TGuaLTSjhtX7yVdhGyed3lpPUp0Jb0WUdIoOlyCkdB25pxN0+ClvDqgB3QL
         shD4+T+Cl/ACZld57sIg6AtjMRx5ZIi2F3wFZvuQ7v4jc1qKkGzg5zG9mHL4/TCiMo3G
         UtoRmz4tdf29FqerLXUSh2heSVAKm0v0t1n6Rqz45YnLiTfZdoJgJ2wmQPv7ipuopMvJ
         H31WSpFtsoSaXu1UiNcJk6PVxj2esimkJS0dUZJdnGwu4ZNRdtw2Yza1fQn03wUqNeus
         R2qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780750644; x=1781355444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=;
        b=NTFw6F8C/++n6YZIUh3hdvBs3FccDMLq549ldHckophfzy51CbFzLkPWq36byKXb+M
         JlW1tmWnTeNjKqqH1VQUzE2taZcJ4EzAIadeTtPcCTBziC1QyDVRqfmDeezabjWF6ghe
         CI2YZkABCsCVvwthnOaF9Ezmi6YGZgL/Pwftl546qfYU/AtjwM9h7ZYd0LuhD10EJeMQ
         qEeudyKQ/YDv6tVA142fzwk5JuSEyx34Udmsi3Ok6SzCyUyPQ0FlOyZmLZVNxwRNtSVU
         2bcKnRSB11oiGQKeGneUPYdZ2AC7QrleOlN73FtSwW/GlfMVxz64S664WWTx+JuJvWSW
         cY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780750644; x=1781355444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=;
        b=CkjUCEtp+PZfB9VX0/89aGtFxIhpfMDHLi9ECjszeYOrMwJfR1JGZNpC5yG0v0gNoD
         NXuyM0eh4y840un5QcksKAs1kkV+m3IzY3Xq8gpM7U3aps6ngzb7v4cnU9m3TrioBDsq
         EC4f54EMA+WWOfUFTK0sb7iKjD5TlbeLuYHUE047C1/wdILoNnkTjW46Wg/ZuJ6X/oTD
         /jce3yKQuLpwUoJGrS0/QVKcf6GBdu0RYdzokRLi0temDj7IiEGpetsPiZ4gQbgnIY64
         Nw4gBwtaxnEmRuTfXurzOhGHLu/x0In3Aepvtvz4YUzm0TLa86pU+VtSkPRWZ5oiEHJR
         gcEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FzOj4VEcefa02ngIfXtOOvgrA6qx0cckp1mxpvizQvwUOwmTc8JbumnN32n8CG0EzTyhIfn7CKvPl@vger.kernel.org
X-Gm-Message-State: AOJu0YxZltV58jYlpQZb0bSjTWpJiIjs/q9McODBP+MDUlppHyFeGPtk
	G24WRC4tklEK5zzzzpLBi2gaM4cctmFmPjtf67ihxFPSANKwZG/87sY8YiqdeaZoazIHN6jhBp0
	433MCV7vyvz6lh3jhrPLJecwltWiTq016P0T/w+L745FnqwYvGUokTVjB6WMFR5goU67+YW4p0e
	LnwGXt5soLBmGUkNjKexdYcXWZH7EZn92Du6aJuoM=
X-Gm-Gg: Acq92OGIRP3vvwqAziKqjpfzgd1EjDMq7CD7qDlWjLctMFE6rUs4VtEUaIxnAx6cI8G
	Cha7is9JyrP9TsFZD7Bewibnu0UzTpwWJDps+8H5L7iDEHJtyYYG2mYippfbhlK78V6U+Jqd1wq
	9rgL4VkI6W3NAghavTV53a5fZqS0CL/CHkrDvw68xfU8wlvspF6x90fBL/SkYmQDFEmHNepNC6T
	xJ4PA6xkvhN4PnlQSQNZEqZMI9M8LBXnziNoADqpJ3UoghSAKpIUUzwJFlG6wJXnEORR6l6nUvA
	FdBC148n689H5xsyROxeUe23GzBmN3eaFeESn+7sUmDH2cWONaVg+WwPfjjQ
X-Received: by 2002:a05:620a:4590:b0:915:a6ca:f121 with SMTP id af79cd13be357-915a9dedaaemr1367557385a.54.1780750644065;
        Sat, 06 Jun 2026 05:57:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:915:a6ca:f121 with SMTP id
 af79cd13be357-915a9dedaaemr1367552785a.54.1780750643596; Sat, 06 Jun 2026
 05:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com> <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 6 Jun 2026 14:57:11 +0200
X-Gm-Features: AVVi8CeAR11CszzTeykil9zbLE-OpnwBQ68EzyKpPXntRU4a3bCccDFMCJWuwUk
Message-ID: <CAFEp6-2rT5fXkWaa-Fd--h8zuJ7kQqPyjedGNXrGvco79yMJCg@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 24hkam3pHwXIzrjdohJ5bbR-RsjqZijm
X-Proofpoint-GUID: 24hkam3pHwXIzrjdohJ5bbR-RsjqZijm
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a241934 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=BrMfsZBUJKb9yWDY1ooA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyOCBTYWx0ZWRfX+E+IH4cgp1oa
 enORNL1ey7EttYBeURKVJHTHCimdXlGaYRh/wHGx0hYEInAFgiFD7jqpWHZxpDQjoNuHWx8Ip1A
 zGDrvaCsDjHKUVFzoa75Z9Kkaero63nMSPQUQtaKk0ujnlQ+3wEbgGbFyqd6sSRTbxZo7Fdj78r
 s68BKMuNuN+NgG3yolQo+1Uo/jq2EFuvTt5+AnaH6etMO4POw3lvVsuZKK1O1WpfPP3g8GjYQVG
 4Kp0wGAVpxZcwjcF3W7S9G2+9akef+VDRNTTYPDHFuM7CyR5s9J7kCqC/W47TQdFsQjRsHkvaPL
 hHNwHBMRX+KpKeIDm6UuKtbGuF/kRP18ag9m+hEgJBL462dYIShqTSs6thsPC1WEdcAKkByY+Ud
 9uQ9tUTIhr+VxkbPkl3lfeGiTw0k+lGQV8X8EwTYMRtHfmDGCWrvQckHrKPAimGXV+a43ff1JEV
 LjfKlzWZotZmWHhgLug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060128

On Mon, Jun 1, 2026 at 2:57=E2=80=AFPM Komal Bajaj <komal.bajaj@oss.qualcom=
m.com> wrote:
>
> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> EVK boards using the WCN3988 combo chip.
>
> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> board-specific regulator supplies across CQM, CQS and IQS Shikra
> EVK boards.
>
> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> with register space, interrupts, IOMMU configuration and reserved
> memory. The node is kept disabled by default and enabled per-board
> with the appropriate PMIC supply connections and calibration variant
> selection.
>
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++=
++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++=
++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>  5 files changed, 223 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79..c2ed0396533a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -16,11 +16,48 @@ / {
>         aliases {
>                 mmc0 =3D &sdhc_1;
>                 serial0 =3D &uart0;
> +               serial1 =3D &uart8;
>         };
>
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       wcn3988-pmu {
> +               compatible =3D "qcom,wcn3988-pmu";
> +
> +               pinctrl-0 =3D <&sw_ctrl_default>;
> +               pinctrl-names =3D "default";
> +
> +               vddio-supply =3D <&pm4125_l7>;
> +               vddxo-supply =3D <&pm4125_l13>;
> +               vddrf-supply =3D <&pm4125_l10>;
> +               vddch0-supply =3D <&pm4125_l22>;
> +
> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +               regulators {
> +                       vreg_pmu_io: ldo0 {
> +                               regulator-name =3D "vreg_pmu_io";
> +                       };
> +
> +                       vreg_pmu_xo: ldo1 {
> +                               regulator-name =3D "vreg_pmu_xo";
> +                       };
> +
> +                       vreg_pmu_rf: ldo2 {
> +                               regulator-name =3D "vreg_pmu_rf";
> +                       };
> +
> +                       vreg_pmu_ch0: ldo3 {
> +                               regulator-name =3D "vreg_pmu_ch0";
> +                       };
> +
> +                       vreg_pmu_ch1: ldo4 {
> +                               regulator-name =3D "vreg_pmu_ch1";
> +                       };
> +               };
> +       };
>  };
>
>  &remoteproc_cdsp {
> @@ -57,3 +94,25 @@ &sdhc_1 {
>
>         status =3D "okay";
>  };
> +
> +&uart8 {
> +       status =3D "okay";
> +
> +       bluetooth {
> +               vddio-supply =3D <&vreg_pmu_io>;
> +               vddxo-supply =3D <&vreg_pmu_xo>;
> +               vddrf-supply =3D <&vreg_pmu_rf>;
> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> +       };
> +};
> +
> +&wifi {
> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> +       qcom,calibration-variant =3D "Shikra_EVK";
> +       firmware-name =3D "cq2390";
> +
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> index e62ba5aef71f..3bfd0050064f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -16,11 +16,48 @@ / {
>         aliases {
>                 mmc0 =3D &sdhc_1;
>                 serial0 =3D &uart0;
> +               serial1 =3D &uart8;
>         };
>
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       wcn3988-pmu {
> +               compatible =3D "qcom,wcn3988-pmu";
> +
> +               pinctrl-0 =3D <&sw_ctrl_default>;
> +               pinctrl-names =3D "default";
> +
> +               vddio-supply =3D <&pm4125_l7>;
> +               vddxo-supply =3D <&pm4125_l13>;
> +               vddrf-supply =3D <&pm4125_l10>;
> +               vddch0-supply =3D <&pm4125_l22>;
> +
> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +               regulators {
> +                       vreg_pmu_io: ldo0 {
> +                               regulator-name =3D "vreg_pmu_io";
> +                       };
> +
> +                       vreg_pmu_xo: ldo1 {
> +                               regulator-name =3D "vreg_pmu_xo";
> +                       };
> +
> +                       vreg_pmu_rf: ldo2 {
> +                               regulator-name =3D "vreg_pmu_rf";
> +                       };
> +
> +                       vreg_pmu_ch0: ldo3 {
> +                               regulator-name =3D "vreg_pmu_ch0";
> +                       };
> +
> +                       vreg_pmu_ch1: ldo4 {
> +                               regulator-name =3D "vreg_pmu_ch1";
> +                       };
> +               };
> +       };
>  };
>
>  &remoteproc_cdsp {
> @@ -57,3 +94,25 @@ &sdhc_1 {
>
>         status =3D "okay";
>  };
> +
> +&uart8 {
> +       status =3D "okay";
> +
> +       bluetooth {
> +               vddio-supply =3D <&vreg_pmu_io>;
> +               vddxo-supply =3D <&vreg_pmu_xo>;
> +               vddrf-supply =3D <&vreg_pmu_rf>;
> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> +       };
> +};
> +
> +&wifi {
> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> +       qcom,calibration-variant =3D "Shikra_EVK";
> +       firmware-name =3D "cq2390";
> +
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/d=
ts/qcom/shikra-evk.dtsi
> index 8b03d4eafa6d..a79f44aff968 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -8,7 +8,22 @@ &qupv3_0 {
>         status =3D "okay";
>  };
>
> +&tlmm {
> +       sw_ctrl_default: sw-ctrl-default-state {
> +               pins =3D "gpio88";
> +               function =3D "gpio";
> +               bias-pull-down;
> +       };
> +};
> +
>  &uart0 {
>         status =3D "okay";
>  };
>
> +&uart8 {
> +       bluetooth {
> +               compatible =3D "qcom,wcn3988-bt";
> +               max-speed =3D <3200000>;
> +       };
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 727809430fd1..95bd797d009d 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -16,11 +16,56 @@ / {
>         aliases {
>                 mmc0 =3D &sdhc_1;
>                 serial0 =3D &uart0;
> +               serial1 =3D &uart8;
>         };
>
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       vreg_wcn_3p3: regulator-wcn-3p3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "wcn_3p3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       wcn3988-pmu {
> +               compatible =3D "qcom,wcn3988-pmu";
> +
> +               pinctrl-0 =3D <&sw_ctrl_default>;
> +               pinctrl-names =3D "default";
> +
> +               vddio-supply =3D <&pm8150_s4>;
> +               vddxo-supply =3D <&pm8150_l12>;
> +               vddrf-supply =3D <&pm8150_l8>;
> +               vddch0-supply =3D <&vreg_wcn_3p3>;
> +
> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +               regulators {
> +                       vreg_pmu_io: ldo0 {
> +                               regulator-name =3D "vreg_pmu_io";
> +                       };
> +
> +                       vreg_pmu_xo: ldo1 {
> +                               regulator-name =3D "vreg_pmu_xo";
> +                       };
> +
> +                       vreg_pmu_rf: ldo2 {
> +                               regulator-name =3D "vreg_pmu_rf";
> +                       };
> +
> +                       vreg_pmu_ch0: ldo3 {
> +                               regulator-name =3D "vreg_pmu_ch0";
> +                       };
> +
> +                       vreg_pmu_ch1: ldo4 {
> +                               regulator-name =3D "vreg_pmu_ch1";
> +                       };
> +               };
> +       };
>  };
>
>  &remoteproc_cdsp {
> @@ -57,3 +102,25 @@ &sdhc_1 {
>
>         status =3D "okay";
>  };
> +
> +&uart8 {
> +       status =3D "okay";
> +
> +       bluetooth {
> +               vddio-supply =3D <&vreg_pmu_io>;
> +               vddxo-supply =3D <&vreg_pmu_xo>;
> +               vddrf-supply =3D <&vreg_pmu_rf>;
> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> +       };
> +};
> +
> +&wifi {
> +       vdd-0.8-cx-mx-supply =3D <&pm8150_s4>;
> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> +       qcom,calibration-variant =3D "Shikra_EVK";
> +       firmware-name =3D "cq2390";

Does the firmware differ from the one used on Agatti (QCM2290)?


> +
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index c1f25ce89bb1..6bac6ebac8da 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2064,6 +2064,29 @@ apps_smmu: iommu@c600000 {
>                                      <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
>                 };
>
> +               wifi: wifi@c800000 {
> +                       compatible =3D "qcom,wcn3990-wifi";
> +                       reg =3D <0x0 0x0c800000 0x0 0x800000>;
> +                       reg-names =3D "membase";
> +                       memory-region =3D <&wlan_mem>;
> +                       interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0=
>,
> +                                    <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       iommus =3D <&apps_smmu 0x1a0 0x1>;
> +                       qcom,msa-fixed-perm;
> +
> +                       status =3D "disabled";
> +               };
> +
>                 intc: interrupt-controller@f200000 {
>                         compatible =3D "arm,gic-v3";
>                         reg =3D <0x0 0xf200000 0x0 0x10000>,
>
> --
> 2.34.1
>
>
