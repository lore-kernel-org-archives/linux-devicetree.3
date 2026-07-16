Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130243F09C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212896; cv=pass; b=m28b41CeyoAeNzoUerchH4Muo0c5lb/yQkdNpduQRfuCoei2//ODjwddShNaKadFxW1wcLALhsWiqu+hzRs5GBO/vdb9QPbdsa+krNah2Dbtbz3RBxs/3eH26o9NakIleU0XvroUOtdHHWk2t5hAyd/kpKhD0OsqAbxS8ZS7G5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212896; c=relaxed/simple;
	bh=hyj3UnvN1eL7blZIruI+pgZz/uFUOhtMU/v3/gNCvNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5y85SayMIubCO/cgMypsGxSeGwPTAyzLwGlpy0CF3U0me6coSiesYQmRrc94Bj+uB7wX8VscWdgGrS0YbqPinyAQBj4amQOwiJpMuE8BC67A/kKY8i9HCgAoSwwRQLhXxMlXkLlJrvT7p2+ZHcj22BBXbd29OQjTVsTdX3HQlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fq32eMEn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWHlB759; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq32eMEn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWHlB759"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJtCB3988626
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=; b=fq32eMEnkSDXCyNI
	O+OEn+jRvMsMTtmNa8m8gqiLuPqA2oGtOQ7mvg4N+hT3NzUjClAuV6CScNuA0TdU
	9GlVijnYeCmS/lYORwfduWOa0mCSQ+XTxd/KZlJ8EhYxOkHk6phRqtYkMugLqSw9
	LPoSTjBDF7DYXdaOBt0fVBPki4cWKimQd3lNASYCEUJMmPcX1dmXxHTBL3kvRqRz
	DNlTd2tZzOkZbFCDvgIIP/2gbXc0oRYzq50cXSc1YrpWpOcmTFyfH1eZGNskfRxV
	8i8Jt7O1K68TUzD3qb/YC2zQSc+00matnHCWmrWfkio3K8+oRzkTlrx3cBJalygz
	NfxUlg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pjs09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:41:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5740so444073185a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784212894; cv=none;
        d=google.com; s=arc-20260327;
        b=dM/BHeV204EwnLQXqFt2LVQG1uWouly3wq+q++7qyrji8AWvWd3N1e8FvcJR27WO+p
         GiMWGRTSyAoTwuNuKjBvnALaxhli7nNot1GhoUf6xi8gSPLdRNoLZ4RQlrVjh+iMwFtA
         mt9F5eLvHs8S7j43wqCR3z8mpiYgjH1k0PbwhsJPym6+PqQyzWBBp0HJRq8fRCvhFCW5
         N1xzIkU3nPCnwAnmcL2pHvqNmgYlZ2mrrQpGh3+cSPvu9TsbI9faOHqkIVLEMjDDhIlc
         tsfXs/QRQXWImyh89DVWM9Sg8Q+atfhrfjygeQA0PqBiqLZCAi0hj5h1R+kJVVXVAaYZ
         dOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=;
        fh=+i39ZUua7/KkmkihVOzvtV3Xz8QhnVWNq4eFOusf7ks=;
        b=Y8kuMtOQQ39wa63LAGjucCOl8Of7lYLN+DUdRsiJfZaE4PNxHxVtcVRuUM0/5AlC9K
         ZVl0Axpg2Bi2lbTEtTP9eJSrieN0doVNrtqgS8xLvqBPvU1ngHOkjpyAGSExW+80QIsY
         M6MwjdOgfGdI0L5lIoDLU77trED/gJgWLl4faUSKemK50g06v8Y6GZRnVd3a+52WPpRK
         VZMXUs9MWljQF5D4vmRM43JUtTtmrxWSf25Xw4EMmZqxGKT2p7LgdAbNJtj3Puak8/n3
         3bwmijjwkLHvDtlO0At0lDhjXVVyFYnT7KG6bePH+T/h1db48ZbZa0ItO/HEHPuZGrgb
         Y5Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212894; x=1784817694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=;
        b=jWHlB759jXQNd0zZbYjd4MpwV+XU4gdVgfvMfhI5T8dEmIZIy+ouJ6l8cbAEz/7gBv
         Y1xPHb0zAmuaEL/wUTvS3/lIF+A8w9kWStPdze7sNanjbfyORJIhcZBYIZwIe9tlOX9D
         icOEx9nXOF8o5igYIKB/8Uv0rnp5y1iE8+Pgg/yBjingtNgHhSXxNjoXuBtFfXqirm/z
         pe7d1kUnrc3yDi3KuN2PbRmT8VntKgx/GAP7XFa0k3LuLynogFWBIrVbwe4xTmu3wFe7
         hwpfpsTM3lh5UDc7BitoWSpethvV2apipvubvQpOVF7i4oFTtO28OVQx8DgwYVp4fcMB
         ZhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212894; x=1784817694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUqxKURSoOVb/5L3BwAiJscutjj+pBqwPiIBk2WAZMY=;
        b=KiLpyP4/qAOUAfBqcjicOWvdPJLwU7gy28TWrElOqKcXBbgdhoK2BrxFgMshqkPiwX
         OWv59tF5tkFBIJbYx8oubB+jpsmT552DeS/1wcy+Btli3J1zbFZCy2u65gR68xWWqMYW
         6o0+KK2WfAuRIZxIh+RklxVzny2U0LR5UOkijsHBAKizv3PQg9Qv6xArrEY3FJNZENeG
         fzAJ+i5HBStgbjskmiRm+O7159ZpE19rKHcMp72cW4+u7yP/gRGLtdYnTeHFDXOV8iMO
         7GtNn/qTF/6DaQGRkUKMK4+ZXp1B5IYDrKYpu3HS+hWBQgp6umVkAwX0RU9kjpmXpbHL
         OEIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG1eogL8P281+Rf0wAwU677xNdK1Xhq9AuzcudHInPbnNVGDhUY35jAbIjuUHIQYlfbFPp67d25F7T@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLVP0tuP+/4lc8svN7b4ulkXEMwNpBLXRevaKN4X+qvPy5Dgy
	eeYK8wURdtE71X5+FyCu+ai55hCzJqhCdQzDyRbtGtL0ZhUN4F5Kuo3EjgFfwAWnXk74Pe5yI29
	6L9Ak8mt0Nkd5QfoxrU1B7U0tZLcVUqUvilI48nc9WROpFhGhzPOZ9NMwr17o7SpMpqPV+GWjoP
	BQfSSJAp9FCR9AsO1RLyzbDPtBLW1fgrfjDQaxLo8=
X-Gm-Gg: AfdE7cktxF9mlxKduaSu71ETUnlX1bQvZgpe0RFG90nAGwzfUs+jLJTxJ/JLdrjwMID
	j1SnmIrcOmKFtvI5NPKeblnGAmWx3MzbFqg6X1mtv946NUtb4uW9RvCydSqJ6OMyEWSGNnA4+Iw
	rxvnkfS7cdl4E1bDVC0oofuHY8isMZueU8dBG3Xlirlt3Mc6/8ioeiWV2v/LXcgctaDGkKDdaD6
	+ZXJx6Li5G8DKaBYT67kLCokICUg7rDyvi+AnLxTkx3rp8OjVqehXIDgWRqylQJwk+YJUr8y/n4
X-Received: by 2002:a05:620a:254f:b0:92e:7733:e398 with SMTP id af79cd13be357-92ef2c61899mr2368569485a.41.1784212892750;
        Thu, 16 Jul 2026 07:41:32 -0700 (PDT)
X-Received: by 2002:a05:620a:254f:b0:92e:7733:e398 with SMTP id
 af79cd13be357-92ef2c61899mr2368564085a.41.1784212892247; Thu, 16 Jul 2026
 07:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
 <20260710-monza-wireless-v3-9-46253587af64@oss.qualcomm.com> <6txwszoqlx5msqhspafk2t66hpdf67tfvc6qejeave3gg4fuby@rosphqguupiz>
In-Reply-To: <6txwszoqlx5msqhspafk2t66hpdf67tfvc6qejeave3gg4fuby@rosphqguupiz>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:41:20 +0200
X-Gm-Features: AUfX_myENjJrfTQJZMSC_KpPtznIhruyFgPIX7MpMY0JW25MDOTnZMlXQyQrAw4
Message-ID: <CAFEp6-07-6wzV7c-8mLDCkfVhgwVQ59BdTGvaXovu5PUGBCDZg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] dt-bindings: connector: pcie-m2-e: Add vendor
 LGA connector compatible
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: TFXH08_Sh7Q784tSWLt5w9N8bpnxHyf5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MCBTYWx0ZWRfX9sJ8/5g3eUfU
 SKsCg9dgIM9SyPDrpkrjXD24JHNUYoDNZYS3DOH0e1fp11+8oXq+n6BHMmzzsELr5+qjjaKtmhC
 F+SjxM9VIxmHjo5qU7Tklo82Mw031PY=
X-Proofpoint-GUID: TFXH08_Sh7Q784tSWLt5w9N8bpnxHyf5
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58ed9e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Kcl6yQRxnNA2GZFW2kQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MCBTYWx0ZWRfX78cbqhMBPBIM
 nje2FH7+flO1M62frsMn8ZiCA3aqJKLI/XoJ82EF3fu4gV8eQBowYXoRChiqRjVsvsxslhjAArh
 luTdsTB1TXKQlYpiWhLqAoSIoJMKIYLipO7v1lVb62+IUv42CJZozY60PprdxPQuA55JnpFOf5j
 3o9ZwIGZF/yTXHOyfQTgJacibEvIcHFNjgSeQXxqq7+FdZCrdvW/fQgdhwKrLIBp6DqwAu/5jmr
 +YiXvWcH4sWVEpVpgbt8IuWa1wbcYCOxnOZr1ek/VryFVEhSlz5EqKLwA2ff08qAFTzQNExK9C3
 Ae2N/Fkgq4e+Yd5JHWjlF+FB0G7m+2VSSZI/BS3R6NhUMXz5RZqdyeavhgHOfhRI655KcCkciiZ
 ekNCCH7PGkVgjRQSnKVyAyjVhrR13uyQ44kCAqckO9X9GXVqj1VpC2WQh7VNdUkYyLtLxmeZImX
 KyGqYbDPKALoBl6IvAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160150

On Thu, Jul 16, 2026 at 4:30=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, Jul 10, 2026 at 11:57:35AM +0200, Loic Poulain wrote:
> > Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
> > Key E interface signals but are physically soldered as an LGA package
> > rather than plugged into a real M.2 Key E connector socket. Such design=
s
> > are not actual M.2 Key E connectors, so describe them with a dedicated
> > vendor-specific compatible while keeping "pcie-m2-e-connector" as a
> > fallback for the shared signal semantics.
> >
> > Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 module.
> >
>
> Could you please also add "qcom,pcie-m2-1620-lga-connector"? It is
> functionally compatible with the Key E connector. Otherwise, I have to wa=
it for
> this series to get merged and send one more patch to add this compatible =
:)

Sure.

>
> - Mani
>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/connector/pcie-m2-e-connector.yaml         | 7=
 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-conn=
ector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connecto=
r.yaml
> > index f7859aa9b63469cb43919c0b5719c18694c5364d..0282c6ee9272446064a99ec=
6314a5ceb1721e0c4 100644
> > --- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.y=
aml
> > +++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.y=
aml
> > @@ -17,7 +17,12 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: pcie-m2-e-connector
> > +    oneOf:
> > +      - const: pcie-m2-e-connector
> > +      - items:
> > +          - enum:
> > +              - qcom,pcie-m2-1418-lga-connector
> > +          - const: pcie-m2-e-connector
> >
> >    vpcie3v3-supply:
> >      description: A phandle to the regulator for 3.3v supply.
> >
> > --
> > 2.34.1
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
