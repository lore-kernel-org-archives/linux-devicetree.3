Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6429DB6C
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878622; cv=pass; b=JrigR1MyN0Mqpz1V6gzMMB7xxgeikgLuGLjlwIfNbwwQ+e24UTEo3RahKyZzWPQD9AQhMRvCG+TnA1C4xYR255f6DTcgc7Q91gt6T1NDWpeZmheADIAz/nzsLxmop1sums2Q5Ke+mB0YXBYta2OW9SZNbqLRpsK01VjogVO8cIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878622; c=relaxed/simple;
	bh=OjqC6P6YsLYtFV11AH/w2jHxwk61Jc3mjX95O+xljNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKdeYoJDxXiTK032sUEIBhCkSBKcnj77xIVA3PyZvQ8GGdrQb+a1Z+hsNoyPdsypUv7JB0MKg2RdK7lBrkRUq0LjVuU4n/auvKUTdus8jmmqzfe2IQ6akBTW68xzs8HMrK5khi1w6dRU9ZkglThkQIMpSUYwN3rMrLsKSbpt4JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WabuMqf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWjh22un; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WabuMqf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWjh22un"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D81F483541
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3oKwXCyliFTwIoCdK9P8JHdmaC7JupCAf1bc8n0FPGE=; b=WabuMqf29mVomZHQ
	ljaa+7MrsOcQu3H6aPuT+CwGsAOPYA3JKhxP2JXwpy663zjmMdayH039Pdn+RCRG
	31GeAoB2ofdI+K7/G6j2tPwDK/WV2YzwEz/tRWlLnnqKcxPPGVZuUNcgiBUKbUDk
	RfxUj+Wf6komcdap3PhewiT1dugXze5fnSV4PGg8YMBNHNcVmCb4wJZRD8cQsaej
	r/K3LJmbb+8GxkVs4xpHT/ZPBYtEXPdycpOKVtY9zvtw27TBr0T63WD91XNkuWWz
	mlLb6UXtqZZ4pEXYWg4ybP3rEjSW0Qg1dOKIUIaKTaxJe2DwNT9cv7uI7vg/OPer
	HU8lTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87sct8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:10:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ebc7ea2402so800863885a.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777878620; cv=none;
        d=google.com; s=arc-20240605;
        b=UaSGza81k3sFwzb5owv12NVqQIWHkkHSNg34Mc8NOL6u6O4/+0dx22y7d/xYbYP9iW
         eEF6DJ0TjwLqN+vKi51/E40IvzYoh2R37Eptt0OprlyMdasvHFIaA5o08mToOe9lMjEX
         p+og7rOCyRWFcdsHPRmBTZHwrEYGHVzdnNiG4cfvIhxWFWjTfE/1lh8P6EMgSInA+gXa
         ubxOJ4fqEO2L4+Z2Qp2PohukkG2rz3LIxDwVa6T3VoWLoaMnKjOPMLyb7wynT8b7vv8/
         DXgi5hWgbKBBGXbtYwNfRmyZeprB5cJuNoF2DAOqBxaKZWz3/9/bGy7gMoLRDsQ6HdK1
         FzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oKwXCyliFTwIoCdK9P8JHdmaC7JupCAf1bc8n0FPGE=;
        fh=JssJqu2UCaWsHz9YvO/m5v0hFfrqjXKaqmjbHa/qkrw=;
        b=QcEomOqhMUN4HPudbdtuNJffoRBsWnal2rfpKfgk/5ZXpAstMMsKte8JQfQqbmT19z
         wpngBOOBw9lMft/BhSJRzM27cz+4VqyuNGR42YPiYFVzxnUgEe+NEh64nP/PdEcoeEy3
         aV3sINqboxQdI0tmQVP5w1Z+DDo6LI+gZKSlKYV0EaWRYEpLqKmAf77sRxsYjRXlnzPc
         65MnIEHdBq7+UIwoJovtajKvERWxsFqxieuKaUCFxBav+NLVZuOg6xw1DxQigHysipQR
         P0QttnCgx6NUlP+z0FBIQ07DSsfwKJ2fVxmald54TPOZX3miADPceL+ZBR6HIzS1ipCa
         eS4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777878620; x=1778483420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oKwXCyliFTwIoCdK9P8JHdmaC7JupCAf1bc8n0FPGE=;
        b=ZWjh22unLI84HFE3cTVqaDnBtcsmE267BVaCXZIgzpX61jdMnZeDVUW07+wZgo33Pj
         UxTjvj83RX22rr+lNyInQVe+xV0xwP983HdthYADQFxPWfsGiagMbsu+xJ8HwvlhfCCV
         LACAzoPlhS4cdvuVFDEBm2kU3KtDLg8RraXtZR+wGhP4f0kvmxM446JDv1a5Gpvb/8do
         +M4Hi8XEL96kio/4hzMFuUa0Oy3Z7BvsdggRqX7Z6KE5KqgGn7bR7MGu66uaELFBB4gI
         jBb/Mv526P5Ce6Mrs9zJ3HnAO705U9v/rA71Us3p8UHZJDelXXV9tBb12g+Li8HN4YrW
         SOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777878620; x=1778483420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oKwXCyliFTwIoCdK9P8JHdmaC7JupCAf1bc8n0FPGE=;
        b=gxsIaG5hxwt92d9RAhNWbN5l9pHI2XWj6M8qorXyr/EkO72RUGBZ4ihV/fZVWltFBh
         PrIByVYeWk9ISnAmMKMIW6DM8hnPs6h1MYT91zYFexJsbl6q2EKZkQOwpxHkab45sNd3
         aQ9ZlevpwKkTtl5r1+tmYFUqBR8QvuWmGHX7fARi2T04jjGQMvCaSxRAasJFJFBS7A3m
         o/RI9cYwhp3bb/mwR1J3tdBDWej5z1rY+Pvx66IiQG1efz+vw6u292qAoRUvif6xaCwS
         glxuJqfn5mquxhIMCYYr4dxCPB2VUu8g+vu8YqD+e/HktDE1Q49pOeH9P1/j5gvHYAhy
         q2AQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3G6yIlKWbTp0Q6o66WbqSaMPDxfX9ZsbOe4M1mnW0mEu1c0nZM0bTrvlDgLc89JaSFoO8VCEQ0Mm6@vger.kernel.org
X-Gm-Message-State: AOJu0YzHaO7ibJg8/nm2a6BrEOlsvMNzIely+ykUghj6cWEzjPAwjEwp
	pTrFV1B60IwRltlwHTT+YsHVGsaj8L7FHFPyVLyWdQUiMvQDu3EfFHSpdJkrEggnedJ2H2p70Qy
	VmFSVqXKA4AA30sZCWPN41anKu9D0/qgBT/QrG7O6euP/bLYHD3fi9P6lpy0vOzJCfp6ymnIlKX
	lNAfX+tCJO1IhvjwK7BSxep7ZVM86ccdGqul3mm9A=
X-Gm-Gg: AeBDievmNZfFJMHviLX+cwPHcCuOIo/0a1pDOINCB9y3edbYGn1+OFnDMuyl+jrEY5X
	FWmG6AOlPZAGMxQ4/P/9SAYE0yGTgJs6mXLRpfkVEQl+A8cUAs8EDEU4n/8rA07heI+HkI+Lgiu
	wBWLw4sE+JUH8e4p8CgN+u7BDOMCx9GA+KyNGcwrOnD0KYTgcpQSE0tgIEr03RDCNaV6DkPibsO
	buEQzaVwLjSKI7VBA==
X-Received: by 2002:a05:620a:13e2:b0:901:2877:ea43 with SMTP id af79cd13be357-90128872d9amr555667285a.1.1777878619620;
        Mon, 04 May 2026 00:10:19 -0700 (PDT)
X-Received: by 2002:a05:620a:13e2:b0:901:2877:ea43 with SMTP id
 af79cd13be357-90128872d9amr555663885a.1.1777878619039; Mon, 04 May 2026
 00:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430142000.3707614-1-swati.agarwal@oss.qualcomm.com>
In-Reply-To: <20260430142000.3707614-1-swati.agarwal@oss.qualcomm.com>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:40:07 +0530
X-Gm-Features: AVHnY4JPvk79cg7zuCQWXjdavvAbq1oIOeFo3Z98psmOnkEbNNtAv_cw5E9_X5U
Message-ID: <CAHz4bYsQ2n2fLhiQULGS_s-oN9DZbabYyp48pJmMQ_9L+z-Ppw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco-evk: Enable primary USB
 controller in host mode
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: hJ1WM5bXwhVLkHNMTN4bd1P66i_4zGac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NSBTYWx0ZWRfX9LQQgKgLc3v1
 sTUp0SWUJHhwZsvtmAFFfz6VMIoENpbVqo0GziPNJXAt6LYoqvPO/f93MXgWV2ZEAi8gxdo9e33
 DUiKDR+gBE97CSW6n88ltn4Sy2zMMmtQKZHlmk78ZI6Ju1dmB7h+H/K+q3CRmy5CVr+0IljdoA7
 uNsxvf/Mhr28/czTTAhbj8hg7FTd1CY/Zr9BqJBVRheK/bdE+Pn6kFiQJ1UZ3rkcqH2WnQ5UDvu
 e/U/83d2/f7FZcJn1ePr7gzZGaiwQTJBTF9fGYV5Z3C6eqd9ju1UWHC6ym20xutmTSs+kFpf/l/
 G0amb86uixZN+UB7dCCnUo1r3s5fL+2wkL6KmOpN3ZNpqSRSLJIqBI+7Hae/96MIRn/wsYCRgXS
 eVLNJbEJuXepIqI9J3xUfFfd93x37w==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f8465c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EhA5XRWN1BnAoB2_VmUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hJ1WM5bXwhVLkHNMTN4bd1P66i_4zGac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040075

On Thu, Apr 30, 2026 at 7:50=E2=80=AFPM Swati Agarwal
<swati.agarwal@oss.qualcomm.com> wrote:
>
> Enable primary USB controller in host mode on monaco EVK Platform.
>
> Primary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports. The ports of hub that are present on lemans EVK standalon=
e
> board are used as follows:-
> 1) port-1 is connected to HD3SS3220 Type-C port controller.
> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UA=
RT
> for Bluetooth. This port is to be used only if user optionally replaces t=
he
> WiFi card with the NFA765 chip which uses USB for Bluetooth.
>
> Remaining 2 ports will become functional when the interface plus mezzanin=
e
> board is stacked on top of corekit:
>
> 3) port-2 is connected to another hub which is present on the mezz throug=
h
> which 4 type-A ports are connected.
> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> connected.
>
> Primary USB Controller
>           =E2=86=93
> GL3590 USB Hub (4 ports)
>     |
>     |-- Port 1 =E2=86=92 HD3SS3220 Type=E2=80=91C Port Controller =E2=86=
=92 USB=E2=80=91C Connector
>     |
>     |-- Port 2 =E2=86=92 Mezzanine USB Hub (when mezz attached)
>     |
>     |-- Port 3 =E2=86=92 M.2 B=E2=80=91Key Slot (when mezz attached)
>     |
>     |-- Port 4 =E2=86=92 M.2 E=E2=80=91Key Slot
>                          (Default: BT via UART;
>                           USB only if NFA765 module is installed)
>
> Mark the primary USB controller as host only capable and add the HD3SS322=
0
> Type-C port controller along with Type-c connector for controlling vbus
> supply.
>
> In hardware, DIP switches are present to select between USB0 and USB1 por=
ts
> for the primary Type=E2=80=91C USB controller. By default, the switches a=
re in
> the OFF state, selecting the USB0 port. Add software support for both HS
> and SS switches to eliminate the need for manually changing the DIP switc=
h
> position for USB1 operation. Add a USB1 hub reset pin to reset and activa=
te
> the hub after boot, ensuring proper detection from its pre=E2=80=91boot i=
nactive
> state.
>
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> Split DT binding and DT patch.
> Use gpio hog instead of pinctrl for usb hub reset and HS switch sel.
Link to binding patch :-
https://lore.kernel.org/all/20260504064936.2754570-1-swati.agarwal@oss.qual=
comm.com/

Regards,
Swati
>
> Link to v1:
> https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qu=
alcomm.com/
>
> This patch depends on:
> https://lore.kernel.org/all/20260427170505.1494703-1-umang.chheda@oss.qua=
lcomm.com/
> ---
>  .../boot/dts/qcom/monaco-evk-common.dtsi      | 166 +++++++++++++++++-
>  1 file changed, 165 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64=
/boot/dts/qcom/monaco-evk-common.dtsi
> index 12c847c03757..2d4ef8666822 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> @@ -23,6 +23,37 @@ chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
>
> +       connector-1 {
> +               compatible =3D "usb-c-connector";
> +               label =3D "USB1-Type-C";
> +               data-role =3D "host";
> +               power-role =3D "source";
> +
> +               vbus-supply =3D <&usb1_vbus>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               usb1_con_hs_ep: endpoint {
> +                                       remote-endpoint =3D <&usb_hub_2_1=
>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               usb1_con_ss_ep: endpoint {
> +                                       remote-endpoint =3D <&hd3ss3220_1=
_in_ep>;
> +                               };
> +
> +                       };
> +               };
> +       };
> +
>         connector-2 {
>                 compatible =3D "gpio-usb-b-connector", "usb-b-connector";
>                 label =3D "micro-USB";
> @@ -77,6 +108,15 @@ dp1_connector_in: endpoint {
>                 };
>         };
>
> +       usb1_vbus: regulator-usb1-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "usb1_vbus";
> +               gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +       };
> +
>         usb2_vbus: regulator-usb2-vbus {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "usb2_vbus";
> @@ -445,6 +485,39 @@ lt8713sx_dp1_out: endpoint {
>                         };
>                 };
>         };
> +
> +       usb-typec@47 {
> +               compatible =3D "ti,hd3ss3220";
> +               reg =3D <0x47>;
> +
> +               interrupts-extended =3D <&tlmm 45 IRQ_TYPE_EDGE_FALLING>;
> +
> +               id-gpios =3D <&tlmm 13 GPIO_ACTIVE_HIGH>;
> +
> +               pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> +               pinctrl-names =3D "default";
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               hd3ss3220_1_in_ep: endpoint {
> +                                       remote-endpoint =3D <&usb1_con_ss=
_ep>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               hd3ss3220_1_out_ep: endpoint {
> +                                       remote-endpoint =3D <&usb_hub_3_1=
>;
> +                               };
> +                       };
> +               };
> +       };
>  };
>
>  &i2c1 {
> @@ -556,6 +629,12 @@ expander5: gpio@3d {
>                 interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>                 pinctrl-0 =3D <&expander5_int>;
>                 pinctrl-names =3D "default";
> +
> +               usb1_ss_sel_switch_hog: usb1-ss-sel-switch-hog {
> +                       gpio-hog;
> +                       gpios =3D <5 GPIO_ACTIVE_HIGH>;
> +                       output-high;
> +               };
>         };
>
>         expander6: gpio@3e {
> @@ -742,6 +821,24 @@ expander5_int: expander5-int-state {
>                 bias-pull-up;
>         };
>
> +       usb1_hub_reset_hog: usb1-hub-reset-hog {
> +               gpio-hog;
> +               gpios =3D <7 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
> +
> +       usb1_id: usb1-id-state {
> +               pins =3D "gpio13";
> +               function =3D "gpio";
> +               bias-pull-up;
> +       };
> +
> +       usb1_hs_sel_switch_hog: usb1-hs-sel-switch-hog {
> +               gpio-hog;
> +               gpios =3D <14 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
> +
>         expander1_int: expander1-int-state {
>                 pins =3D "gpio16";
>                 function =3D "gpio";
> @@ -784,6 +881,13 @@ expander3_int: expander3-int-state {
>                 bias-pull-up;
>         };
>
> +       usb1_intr: usb1-intr-state {
> +               pins =3D "gpio45";
> +               function =3D "gpio";
> +               bias-pull-up;
> +               drive-strength =3D <2>;
> +       };
> +
>         expander6_int:  expander6-int-state {
>                 pins =3D "gpio52";
>                 function =3D "gpio";
> @@ -863,9 +967,69 @@ &ufs_mem_phy {
>  };
>
>  &usb_1 {
> -       dr_mode =3D "peripheral";
> +       dr_mode =3D "host";
> +
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
>
>         status =3D "okay";
> +
> +       usb_hub_2_x: hub@1 {
> +               compatible =3D "usb5e3,610";
> +               reg =3D <1>;
> +
> +               peer-hub =3D <&usb_hub_3_x>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               usb_hub_2_1: endpoint {
> +                                       remote-endpoint =3D <&usb1_con_hs=
_ep>;
> +                               };
> +                       };
> +
> +                       /*
> +                        * Port-4 is connected to M.2 E key connector on =
corekit.
> +                        */
> +                       port@4 {
> +                               reg =3D <4>;
> +
> +                               usb_hub_2_4: endpoint {
> +                               };
> +                       };
> +               };
> +       };
> +
> +       usb_hub_3_x: hub@2 {
> +               compatible =3D "usb5e3,625";
> +               reg =3D <2>;
> +
> +               peer-hub =3D <&usb_hub_2_x>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               usb_hub_3_1: endpoint {
> +                                       remote-endpoint =3D <&hd3ss3220_1=
_out_ep>;
> +                               };
> +                       };
> +
> +                       port@4 {
> +                               reg =3D <4>;
> +
> +                               usb_hub_3_4: endpoint {
> +                               };
> +                       };
> +               };
> +       };
>  };
>
>  &usb_1_hsphy {
> --
> 2.34.1
>
