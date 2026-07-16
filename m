Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6553DB310
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193215; cv=pass; b=HiFOGgHB5cI3llheUj854ra3Y0IweUO8Pk8t/jkpsZXokb79dtaMwbShvmQJBrCFIaHH+dKMFSmT8bhoa/mhMsXGIhkyt4RmfrYjyzQNXwrsy8+cDa/iYV4x/OHPSwr92iwoUGa/lvbywVfYVi1zpwiIH2AREBK+EmOFeNGYi9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193215; c=relaxed/simple;
	bh=uCqDdKgSE05wWFAXOn24NCojvJkTjvFV4xaFhIaDAx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uK2zf1Sd+7Nvdqcvu5sYcoDqBAlWvPFO/fjWQ+hsgCv/YG3WaXux83Qa25U8Zda2uSm5+lMzxszLdi4CCvp0AKd8wYIojnQq63dwHA+J+cTOgkb9TgXebMyAtWZOD+rMqS4aMM3HQBFgKxMP37PaB6saZy8P31E4Phzgnb3pwmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7+5EgcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwLzV0hW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7+5EgcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwLzV0hW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G99Txb2315241
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=; b=d7+5EgcKohigk/Rr
	f50a0z/LZV72FFBzPnB6iROcFhInecWl+0+L0nY99Z41rukIuVSOycIuzUr8v6u1
	YzjXctSOPfKgBVAOxptCXH+HqIPNSsAgSdenpQm/tzJXy3Z1mQiyoNsvWNe8nHQY
	qy5rsaM3RL1ctlWQLte+ZhcU4mIkDF3clW0nMB+E8GgpBhPQbyffYyS9Od0w88w4
	4x91VBZjg2haPe8dxW5CjnJ29A/PJoExvtdKA9LKvcFb3XmtFjoioxot6lUajnLk
	r4i+E2BmY425n4WZEI6Zyx1MEPY/a+j7WCdKMeMa9TqBRbj8+KnLAAcMWUDu85Rv
	0PMEeg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1r0gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:13:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so96109996d6.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784193209; cv=none;
        d=google.com; s=arc-20260327;
        b=CW5Ivxpdceow9K7A0SZA0q80GOmjCcz7C7DhzEFfOqqgbfTg1AJq4r5zP1hr1Y+0KI
         +po1rVyrz9SYV+iCqfkLj/cd1XF2ilzDXsIT6Lr0m7Eno7C6YAAcDlYxONKyjCLQvC2B
         gq+MMEvHz0Rfk1iM2EN13i21fnzalELHT2yG1msbn5/jOrkEcHX0e6FFbTJTYxmMi+Gn
         4U2MOfjafB7oJRxCCEkJnN5r4qo7ZnY4SLgNnEnISi8UBWz3Wxo8ODGVLuk8xX4Q/TMS
         alui1ZIBBRAsxN3w3Oesvx2CQ4mSAO0Q0POgIVw1NLPu+z8OuhD55SWxppiIfv/Xuj7i
         FfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=;
        fh=kpHJ7Hzpd/w4S28ICmiz+px/fYeu8oKzP6DgyLcoqT8=;
        b=rkec4MbTdsqq4hv8OAYTABozPSBLu/bNq4ot6zDEePR7XoCuwpAPf3tNNEq6nG7q5T
         u7CuKUs4ik7bQ5t1rvShTkkjf+oY6SRA8L8UGRMPsFYcdjnVgE2V0O/dFk0px7cwnEWV
         evgVA0sAkgHdVB5u9n1I+zk4FcTo4OcK7W4/gQhM7KWc2CLWHZcYstr/wwhK78Nx/5ei
         lajhfsjBhdnklk+w2JdpRhhpAxsSJd8bHYr2vM+6yHRkWN1RlDddt3BlzglBl+jU0y/D
         gByzxwrEz2sPgE+zbPKd2V6V/ryU/pC9Rx3x+s/YcU/omza4Erljmj21BG+QdUu04yFQ
         VBNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784193209; x=1784798009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=;
        b=TwLzV0hW33RYt8nI0/zpwTi7ztoge/roka6KcZ0Jcdz9gRd2W0DHuaLsVUVXZdz4fm
         LOZ0smBTI+KUX5b5koWhpGqvy5jO14cE+INR+8QkJUYK5ujgKWhnulvLTp9IhdcXdj4V
         +a0h2sg33nJu1QJuQDW/bT9U1uej3ZaTLCjbV9runbis7DrI6v7WSmXs15Cc0vtupRbt
         PAaTzIlB0Q0RFJ4l+rnZcOb59NkdFkXe8p0VAjhH+AbtEdRsKkERuFRvcZxt4mVpk8Q2
         XapZGn3a3bgZ9+xnIlzdHyk2uTmuY4LmQiAHPGj3z93FRJDT8pHnvpD3iAtWfIEH+WG3
         Qgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193209; x=1784798009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=;
        b=C8BNsURphCneEl4gL5KcFQRpKzF7pYQfkSb9q1C9Cq1kGPkM4RzRlFkXdALiamuQHC
         NSgv2Mrh0OW3B98YGGWwGJwya0dEWer0ozsgcpH2V87Qa5/piBZYD27sXs4A6Iqgz8dX
         h3Dg2sd5sKdnUPKzmkgJf4l/3nsOTI5+/Ajl/u85thSqNvI2TIwNONFbA0ZectOsOuGM
         N65tTtDWW66LrI0sAla10TerpSVCueTiNNFGrovfLNtW5It/fSOPDkpYx5e8zmtfwifJ
         v/WIKIi/DKwdSeJieqVL/LUIJX5dew80I+wGFKKZpwCNSGkTOZ4v+134xv/5EglCBcw9
         Swag==
X-Forwarded-Encrypted: i=1; AHgh+RqB996NmKo0JOONnJDYxVGlpJW1pr4JAXP//h7Vuab0hlw1QY6+KOcpVv8NMtEIGW8P3jKfOCwOzxWk@vger.kernel.org
X-Gm-Message-State: AOJu0YwaW3PqElAtgkY++MM02Yjba/CE8YpDSVnQqrNmCcsjJq5z7CWe
	o+EAEfE4xAd+PXW6y6fPiI3vu/e/5RqCTcJofzRdoCGIytN1lg14bJXZbwjoJSYxei4WHci2CMd
	Jpn/DnS604qjT3B3IpM0lN4hTb+luSwIBAmi2dgfQHVQ5NLO1Gf8cQhj+DQrA1lRbJnhmAwkN7j
	NpTrHFAnBwmKukCDmH5jbL705HlK8laQU9hjtzIcQ=
X-Gm-Gg: AfdE7cmDStFQMAH7tSfq0FmJEyxZY/HnurRvHnvqz1CN6XcNbTKX9fVz90jxRBo91pj
	uWS1kLshVjQjnVsolT9vcnOiZqE0S31L79eHiOZ/nNCxCt0H61hKTyEoagmTh4wBKylalRlQx03
	bp1foQSv74Qcu1j5SCqwUmBvlREv1BucNd+uRrCGiiXMqbOsO1tDeoV8H7GlOZN2rFNUs6uLZtM
	a7fqA0xB+VmlU5cyN/XnWdfr0bId7FEtcMNofA9NfcwfLs7lpZYRA7WfKWAipnUKv/tX0T2oC2+
X-Received: by 2002:a05:6214:428d:b0:8ea:fb8c:2e0a with SMTP id 6a1803df08f44-9074c766c6cmr114860216d6.28.1784193209377;
        Thu, 16 Jul 2026 02:13:29 -0700 (PDT)
X-Received: by 2002:a05:6214:428d:b0:8ea:fb8c:2e0a with SMTP id
 6a1803df08f44-9074c766c6cmr114859886d6.28.1784193208701; Thu, 16 Jul 2026
 02:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
 <20260710-monza-wireless-v3-8-46253587af64@oss.qualcomm.com> <20260716083141.GA4101439@google.com>
In-Reply-To: <20260716083141.GA4101439@google.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:13:15 +0200
X-Gm-Features: AUfX_mz2l-ruyrBEqJdkcXUQ_DW7F-Cm1EuP-VtmhPBeabFSDhnP6vsS9Wv2wFM
Message-ID: <CAFEp6-0UJyekA7zE74=CgneqvxDbea0Xw+u8O14bpcHX8Yb57w@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MyBTYWx0ZWRfXzEuYPvYKi08z
 aPfS5tfjqrdoRPyUySzjGKo5nzMrZFjEd02LAf2Dn8t+WtdmKnHBV6xDSnUw7CdzRy6105AWsj1
 7dcxnZDtDEZKMuCTmcfaWTNNiHoThtMZ85H/EDm1FpsuSwgGpeDAmmib5uRofp+00OxCEpLWIzs
 kTtCEuMIYXPmA1JxVkOKLvTZoioY6q5iJaK/8TAwh/kUYhgJ8JRTl2Xe6Ijl9h2z6VtFJOMLTQu
 9rIPWxyuUOLj5+M9hxPijv9DBDguVOhMlCRMMYXAYrJJ9gtpRyD10YJUE3V/xp72/twLB+dTW6a
 M87FgjkJXvMNWTgq7CUr/TlvJ9uKIQ3TPj4vKg4YS/7CmIeFFzkLcLYSVx0MRrIRFTV43iOsfQG
 gww2INAZTG6X+Kto5EJu67mIbbBNQFCgXsiW9HfRJBNd8X67hTSh0mZt5oRwr9dXd+6Y1Jwfrz4
 mXj1KduXvRi2YI8sDLg==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58a0ba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UD6jFWV5_MqAamJTNaQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 9jcDNb716V8dNKDZm8KI1NHJ3ilNF8tQ
X-Proofpoint-ORIG-GUID: 9jcDNb716V8dNKDZm8KI1NHJ3ilNF8tQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MyBTYWx0ZWRfX8AirVsS7N/pS
 ypSYKpzvNi8VHK83IWnvuckRBs7QR54tdhJQfZe2K3NDmJjzSNW160xterSOd+scVWuXAejl0Nu
 QcCXXqvS0hgdniQidW86yA9j0CdXKKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160093

Hi ChenYu,

On Thu, Jul 16, 2026 at 10:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Fri, Jul 10, 2026 at 11:57:34AM +0200, Loic Poulain wrote:
> > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
> > controlled by the W_DISABLE2# signal managed by the pcie-m2 power seque=
ncer
> > rather than a dedicated BT enable GPIO.
> >
> > When the serdev controller has an OF graph (indicating it is connected =
to
> > an M.2 connector), acquire the 'uart' pwrseq target from the connector'=
s
> > power sequencer and use it to control BT power instead of the bt-enable
> > GPIO. This is factored out into qca_serdev_get_m2_pwrseq().
> >
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/hci_qca.c | 35 ++++++++++++++++++++++++-----------
> >  1 file changed, 24 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 24dc5bf6d192be7e1d500df6bdf36e6184f9eaf7..f6529d359ffbd97f8a3c4c0=
593680ab200215b36 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
> >                       /* Controller needs time to bootup. */
> >                       msleep(150);
> >               }
> > +
> > +             if (qcadev->bt_power.pwrseq)
> > +                     pwrseq_power_on(qcadev->bt_power.pwrseq);
> >       }
> >
> >       clear_bit(QCA_BT_OFF, &qca->flags);
> > @@ -2387,6 +2390,20 @@ static int qca_init_regulators(struct qca_power =
*qca,
> >       return 0;
> >  }
> >
> > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> > +{
> > +     struct serdev_device *serdev =3D qcadev->serdev_hu.serdev;
> > +
> > +     if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> > +             return 0;
> > +
> > +     qcadev->bt_power.pwrseq =3D devm_pwrseq_get(&serdev->ctrl->dev, "=
uart");
>
> Note that this ultimately ties the lifecycle of the returned pwrseq
> descriptor to the uart, which is probably not what you want.
>
> I ended up manually doing pwrseq_get() with devm_add_action_or_reset()
> so that the descriptor is released when the serdev driver is unbound.
> This was for the Realtek driver. I haven't sent patches yet.

Thanks for pointing this out. I'll fix it in v4 via devm/action.

Regards,
Loic
