Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074184;
	b=yF+InwUCScbEb+ixlS39K16HESqxBMJh2Ooxe2LollUYdoHWHUkUx2yGkTQKWux1ktip
	 pk75Oo4xPiBXAqM8SHRuTXJ8Hqp0OIspvoUWG7W8VbK+OIpcA4OS6ykURKQYaZN7e8MSV
	 qHZ3jNG201b63Wsqd5bgD+1v2jbCN3nAMxyJbhlFC5sNJpNCx4TQQHrKhZYT1A8pwOmS+
	 PxZOCM8q6WROwyCBkkgI7Hz5YG7YgTiFZTqh+wk+cUy+R3mysDXsHLCYKaY2MavlXdRgO
	 y9ecccz/lvV4woxCzk3NcJn4l4OPw7ar4uYB3Ka1EMsfjnAuH13oqo5KatSTx7u5qqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
	b=IAVdj54W0lmMN8Z5hZgVXIqZoK52HTy+XSw1nVaAnIdpWb4jlHm9pLzMTfyldkL30jeT
	 aa7UeOgdqPJEp64m1AUl3wwcLQBrY7mwTjVLLU5GjfcjKSbDfbJH3oO5MhFFv5M5ZiTdt
	 VTzih/X06Ys5c+agwIHzwI78Z4yTliuESXOWsqSYVFm6bpWjFJOieyOMinzS0A2hCmE0A
	 0gtefJjA5tLnowwTpapjU8qqq8v+uu1Xj3njHTrcPpxrNOc4iJ1IDqlpHXbRYZVDnCqP7
	 xo90nucvVq4BcCSb/dvXLC+rNLng4MuL8h+jdyPbkLCX5Izqk7ipQqlzm18Lk8ClbnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b30dbn0E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68692606A31E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68692606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b30dbn0E
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F1Mo3986836
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=; b=Jrp9PEbO8E+rTtwv
	XSkewXOHXjc+TWaVhnoZ6nf4ZFtVGFBK04sY3ZiyxEbIQRfaKny46gNp0YUwTvuu
	NYUuzhAOIAxEngvKL/cB1c0SuThts2znYxF/8dAqY6NSmSTJV6RBC03UQzSi0oo+
	xMVUhiq3Cedqt2kcG1gP3BlcqSwgeFlTTnr4zKbVuipNHQRqCCGI0fOptXrg1huv
	syhhbPeratSZ+7dDB85YuLBtIRcQHMkmx/J3VNm/MFln9x4u5dr5Wo+/CRqiZCZq
	dH6LHfqmNInKqB1LpQlk1BFlCd9rsMC7SD7fFeKyrJeEGLCdl5ch4ya/i0qt4C7X
	Bh1ZPg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smtp3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eadfb67611so662594e0c.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793074182; cv=none;
        d=google.com; s=arc-20260327;
        b=jU1Cfs74OfacgHawV6bw6DdhmLZE+m+8wTP0DPNjjb7itjuDJcUwtdVFUGnBCvN4Vw
         S+g3LSybMFTq6VHlUB8zwW1dmEpPO7+l+2UtWjhevwyyk54FzaNm+e5wAHIqCP2uOZ+e
         spAECKmsrbq1GMnhEVTxv57m8aM4LFPWMSpgR8CY8tg4EtH9vcgZgnVqjX/23qKLaa28
         x9CsoMTEFQfOaR/ZuMM2KZX1rwbeXNW1Ft95xRS04X/pGD386J5sqcYCcLxejcsJeh6u
         rQJs8v2aMSXfibTPctVGsIKB+WxtqNUuCtI1IC3h02rL0z+sWuOo/HsLGBJuihoBPICt
         aTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        fh=3yMfjFwmE/QdffVuZJGxJVmC0BGLpiR2MjaCPf2TPOU=;
        b=GOlJOxQmpQS6eFH/Ax3g2EpMAESk+zQnwQRI5gDlUeEIO/DOx6e/CT4tzhEtwGhXLs
         TlNe378YYdnwleATi3kHYsHtnis15uCvKbWvE3A64i8CFRzyXkFiLV5YDdKSPL1BWfUY
         xiMmFW8nNxqh8dGVm8ZUSLD/MeRSAC6yuiAYuPXzEPRY3uAv7zWjNM+NI1QdNA9mglud
         +iL8NHUBxE4Z1LtbYoJssuQLUaR0ALVC49ZZawA7rGCYXqMtxTYdx5H3VEmt1GQxz1e8
         HXW49em7rPRD4gWj5Fg1RPUVOCD2679lP3GbIzb6Fq01etuFLV7AnVfX8Vh4FZoYRca7
         DlMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793074182; x=1793678982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=b30dbn0E7eSYHbpwzUA+0uIauVn2Y3xZPyisawysax2bqq0jasQNx4r2MptFnybCM1
         p0Qms1gMDsIyobp5o16PCJILzAR40S8zjx9XdCPKXxhvVtYufNxjEHPtThx4lNXVtcG7
         quNV7MevjT0SJstZsPNyxgCyQ+qB3IuNrR1s42Jh4rWq/Dk57UwJPTdgf1O6DSv6tBjo
         O9cCJmB7Oow9m8ziknLFJV22pPrscdgtauctwN+KMSDPDxUWOum+OpNCSBlXklnI9C7Y
         feLrxB/TNZeYYbG5n8OnHBlLoWNTn4mjSeL6pvQVehKClw68iO5ddi5WBMp7Y82tLH8h
         6NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074182; x=1793678982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=ubwWBEMoYaJWOp3TfVESQV5jFnh7/YrAwpriq0sUsKP+fx55DAo1ByODUvVCO4ZJnB
         WT+9u96GGUS7mno5F1sapXVeKFAUonvNBPPB6L5okhE16tgwhh1rJD26RXYr+yHMePm0
         JcH/4SJshbItxgybitTTFwY0srJSX4hH7p2VAGxkSvq44zeKRUCJ8nSGBhB1Gm9K+Y4n
         u/LzvkJkMxn2jGqXOOm5b0elYHB8NRSdGSTK+qZ/npRIvqLDCuZoSFJeZKZb95IL/CIM
         VPK7oAQQjFmqyPRanUq3qT2M9rZPnFR7x6nylElMjiqyf4PKs9fKE0YotaKxABGa710E
         GqxA==
X-Forwarded-Encrypted: i=1; AKwUvByg0ti7jHm6Vv9gzIJetUFFQI/t5+NmlmGXtt/9eTVa4UBl6PmYrhfW/HQn0R3eAMV397izktbCQ7i4@vger.kernel.org
X-Gm-Message-State: AFq9FYLbKAHbdYjtcYSjU4bK4G1tUNzVYTaJu2p+TuOUhpkPvBhhzhVv
	BwqMboOHsgrayycxVBL0Wp2ffUH23wTMTF7ZkqyYlu8Vtg/43/yGV64nEtQfSMTjEz84v27e5pT
	hHmB0X3swC1D6X4CgjEqjPUnBoj3CZQkNyZxQLmPfM8/xzfpWTwaApIvy9KX6yHSFDW1DvwtPaA
	ttONWfvXujJJ7yxke4sPtDkYgM+4bGac1Gl8EaCxw=
X-Gm-Gg: AYBFou0CSSX0j/7SSZf0ngYNednDWQ9Ak3HZtq3Eatm1+pacYtYO4ZwrD+MQDbMuVVV
	7nafs3YGd17A4cZp/CQpyL24i+9AGrW2BDbVkboKEtAdzbvjII2/4ORAYk8PpNYsuu4Fndkm38A
	amKRSAepgfEy5YTljWRbuzQog5N6dpyS7haRNJsSkmk1l7fX5oeLPM3QRtx0C2II2nbmT1EcnTs
	upv1a/9PJy6s3D9dQ==
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id 71dfb90a1353d-5ec232fd7e4mr3193904e0c.19.1793074181379;
        Mon, 26 Oct 2026 21:09:41 -0700 (PDT)
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id
 71dfb90a1353d-5ec232fd7e4mr3193894e0c.19.1793074180884; Mon, 26 Oct 2026
 21:09:40 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
In-Reply-To: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:09:29 +0800
X-Gm-Features: AclHuK9zQUYmMt2_uRNQKGHKLEw3Bs7CkPsj4KjP69u-e7zyINlKrBFyGote1T8
Message-ID: <CACbMrhr3imVV6nNLisD+gh=wLPn8ziw8wRL0UW6e-6by2RufFg@mail.gmail.com>
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LiEajS5EtRfBWfr1tAaUDQ86HttKuqr7
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae02406 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VpRCVQi9ATEJuri8zQAA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: LiEajS5EtRfBWfr1tAaUDQ86HttKuqr7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX9AHx1aEZx4Xu
 UpjSRENafSphPsDgkUJLuAvCbzwlHxDPIwxnip0Rex6xQAt88X8I6z1dyh61C9ffVPKu4/xyyLt
 TJ+SGrv5gXWp3ZHdwqSIsUjjcqkNQpY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX1Pm+KDuIgiyu
 mCFVsz4rccVbUFBTPdKMiCYNO6zQQTTKTr2AOOGAw51bzqzk5m2mE+gqq55vGPFcMOa8MH+1651
 BOUinuQACbiYtbajgPx1xKRuAkUAqYnyc4oVTuM8U3iWtuHXmiSAZ7WwMyOZ9cpHLNOCL2AEJlY
 mtSd0xT/VtTyYeDr0ZSdXwfCa+J4mc1IEH7aeg/iKykJL/Ua7HcnFZt1eKyC67th74UaI0dPx6h
 XVX6Fa5sGxUhuUQNMMRd2+4kLv1uAtkcgyWz4sIcDLLQYhu1il6SSZicP1+PLQMSW9+xOSoo3zq
 yex7f4Lx+8ZzwGjBFSfqe04Gqgwgh1NctYk0+PF9Nb/uzC1SElkceVueMmkyyt8n+8iWDZaxSC1
 eFwcmQ4AcnjQJWl4V1bgkuGZxczobAghd/3gsVq9l2N+kXpNReImi4TFlst9I2m6rAwfXhl/VXV
 ddrnaRKhStR3QK1jNxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270016

On 10/26/2026 11:55 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
[...]>> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells =3D <2>;
>>                          wakeup-parent =3D <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +                       };
>> +
>> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>
> Why do we have a sleep state if it's identical to the default/active stat=
e?
> Do you want gpio with pull instead?
>

The sleep state is kept so that the CCI suspend path has an explicit
pinctrl state to select.

As discussed in the v19 thread, SDA and SCL have external pull-up
resistors on the board. Therefore, enabling the weak internal pulls is
unnecessary.

However, I agree that keeping an identical sleep state is redundant. I
will change the sleep state to GPIO function with bias disabled, while
the external pull-up resistors keep both lines high during suspend.

Link:
https://lore.kernel.org/all/d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualco=
mm.com/

---
Best regards,
Hangxiang
